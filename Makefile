# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: thervieu <marvin@42.fr>                    +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/11/27 13:29:35 by thervieu          #+#    #+#              #
#    Updated: 2019/11/27 13:29:36 by thervieu         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libftprintf.a

CC = gcc

CFLAGS = -Wall -Wextra -Werror

LIBFT_PATH = ./libft/

LIBFT_NAME = libft.a

SRC = ft_printf.c				\
	srcs/is_x.c					\
	srcs/manage_char_and_str.c	\
	srcs/manage_flags.c			\
	srcs/manage_int_and_ptr.c	\
	srcs/manage_percent.c		\
	srcs/manage_uint_and_hexa.c	\
	srcs/parse_flags.c			\
	srcs/put_group_functions.c

OBJ = $(SRC:.c=.o)

%.o: $.c
	$(CC) $(CFLAGS) $(LIBFT_PATH) -o $@ -c $<

all: $(NAME)

$(NAME): libft_recipe $(OBJ)
	ar rcs $(NAME) $(OBJ) 

libft_recipe:
	make -C $(LIBFT_PATH) all
	cp $(LIBFT_PATH)$(LIBFT_NAME) ./$(NAME)
clean:
	@echo "Remove .o  ..."
	@/bin/rm -f $(OBJ)

fclean: clean
	@echo "Remove libftprintf.a ..."
	@/bin/rm -f $(NAME)

re: fclean all
