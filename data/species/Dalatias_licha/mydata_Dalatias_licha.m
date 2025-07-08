function [data, auxData, metaData, txtData, weights] = mydata_Dalatias_licha

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Squaliformes'; 
metaData.family     = 'Dalatiidae';
metaData.species    = 'Dalatias_licha'; 
metaData.species_en = 'Kitefin shark'; 

metaData.ecoCode.climate = {'MA','MB','MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMdb'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(14); % K, body temperature
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                             
metaData.date_subm = [2020 10 19];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV Amsterdam, the Netherlands'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 01];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2  = {'Bas Kooijman'};        
metaData.date_mod_2    = [2024 10 26];                           
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};                 
metaData.address_mod_2 = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 10 26];

%% set data
% zero-variate data;
data.ab = 365; units.ab = 'd';    label.ab = 'age at birth';              bibkey.ab = 'FranJone2018';   
  temp.ab = C2K(14); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 12*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'FranJone2018';   
  temp.am = C2K(14); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 36;    units.Lb  = 'cm';    label.Lb  = 'total length at birth';  bibkey.Lb  = 'FranJone2018';
  comment.Lb = '30-42 cm';
data.Lp = 120;   units.Lp  = 'cm';    label.Lp  = 'total length at puberty';bibkey.Lp  = 'FranJone2018';
  comment.Lp = '117-159 cm, but 96 cm is also reported';
data.Lpm = 90;   units.Lpm  = 'cm';    label.Lpm  = 'total length at puberty for males'; bibkey.Lpm  = 'FranJone2018';
  comment.Lpm = '77-121 cm';
data.Li  = 162;  units.Li  = 'cm';    label.Li  = 'ultimate total length';  bibkey.Li  = 'FranJone2018';
data.Lim  = 132; units.Lim  = 'cm'; label.Lim  = 'ultimate total length for males';  bibkey.Lim  = 'FranJone2018';

data.Wwb  = 268;  units.Wwb  = 'g';    label.Wwb  = 'wet weight at birth';  bibkey.Wwb  = 'FranJone2018';
  comment.Wwb = 'based on egg diameter of 7-9 cm: pi/6*8^3';
data.Wwi  = 49.7e3;  units.Wwi  = 'g';    label.Wwi  = 'ultimate wet weight';  bibkey.Wwi  = {'fishbase','FranJone2018'};
  comment.Wwi = 'based on 0.01170*Li^3.00, see F3';
data.Wwim  = 26.9e3;  units.Wwim  = 'g';    label.Wwim  = 'ultimate wet weight for males';  bibkey.Wwim  = {'fishbase','FranJone2018'};
  comment.Wwim = 'based on 0.01170*Lim^3.00, see F3';

data.Ri  = 12/365/2;units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'FranJone2018';   
  temp.Ri = C2K(14); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '10-14 pups per litter, 1 litter per 2 yr';
  
% univariate data

% time-length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.088	42.913
0.330	41.600
0.813	81.365
1.011	60.164
1.802	80.820
1.978	86.050
2.396	72.695
3.055	109.578
3.297	106.956
4.527	118.443
4.681	148.271
4.725	77.093
6.264	141.433
6.330	134.890
6.374	143.524
7.363	113.409
10.176	129.310
11.275	144.987];
data.tL_f(:,1) = data.tL_f(:,1)*365; % % convert yr to d
units.tL_f = {'d', 'cm'};     label.tL_f = {'age', 'total length', 'female'};  
temp.tL_f = C2K(14);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'FranJone2018';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (mm)
0.527	53.895
0.923	55.456
0.989	62.520
2.901	87.600
2.923	101.730
3.253	103.031
5.099	86.767
5.385	121.041
6.396	112.383];
data.tL_m(:,1) = data.tL_m(:,1)*365; % convert yr to d
units.tL_m = {'d', 'cm'};     label.tL_m = {'age', 'total length', 'male'};  
temp.tL_m = C2K(14);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'FranJone2018';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Lb = 3 * weights.Lb;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%weights.psd.p_M = 3 * weights.psd.p_M;
%weights.psd.v = 5 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Temperatures are guessed; fishbase gives 5.6 C as preferred, but data points to higher temperature';
D3 = 'mod_1: males have equal state variables at b, compared to females';
D4 = 'mod_2: p_M reduced';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = 'aplacental viviparous';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'bathydemersal; depth range 300 - 600 m'; 
metaData.bibkey.F2 = 'fishbase'; 
F3 = 'length-weight: Ww in g  = 0.01170 * (TL in cm)^3.00';
metaData.bibkey.F3 = 'fishbase'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3);

%% Links
metaData.links.id_CoL = '33YT6'; % Cat of Life
metaData.links.id_ITIS = '160651'; % ITIS
metaData.links.id_EoL = '46560177'; % Ency of Life
metaData.links.id_Wiki = 'Dalatias_licha'; % Wikipedia
metaData.links.id_ADW = 'Dalatias_licha'; % ADW
metaData.links.id_Taxo = '41815'; % Taxonomicon
metaData.links.id_WoRMS = '105910'; % WoRMS
metaData.links.id_fishbase = 'Dalatias-licha'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dalatias_licha}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'FranJone2018'; type = 'techreport'; bib = [ ... 
'isbn = {ISBN 978-1-77665-768-1}, ' ...
'author = {M. P . Francis and E. G. Jones and C. \''{O}. Maolag\''{a}in and W. S. Lyon}, ' ...
'year = {2018}, ' ...
'title  = {Growth and reproduction of four deepwater sharks in New Zealand waters}, ' ...
'series = {New Zealand Aquatic Environment and Biodiversity}, ' ...
'volume = {196}, ' ...
'institution = {Ministry for Primary Industries, PO Box 2526, WELLINGTON 6140}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Dalatias-licha.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

