openocd -f interface/stlink-v2.cfg -f target/stm32f3x.cfg -c "program build/Example0 verify reset exit"