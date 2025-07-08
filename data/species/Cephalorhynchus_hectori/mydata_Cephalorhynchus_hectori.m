function [data, auxData, metaData, txtData, weights] = mydata_Cephalorhynchus_hectori
%% set metadata 
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Delphinidae';
metaData.species    = 'Cephalorhynchus_hectori'; 
metaData.species_en = 'Hector''s dolphin'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPSE'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36.9); % K, body temperature
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li';  'Ri'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};                            
metaData.date_subm = [2018 07 16];                          
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam, 1081 HV, Netherlands'};    

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 13];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data
data.tg = 365;    units.tg = 'd';  label.tg = 'gestation time';              bibkey.tg = 'guess';    
  temp.tg = C2K(36.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 365; units.tx = 'd';  label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';    
  temp.tx = C2K(36.9); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 7.5 * 365; units.tp = 'd'; label.tp = 'time since birth at puberty for female'; bibkey.tp = 'Sloo1991';
  temp.tp = C2K(36.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 7.75 * 365; units.tpm = 'd'; label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'Sloo1991';
  temp.tpm = C2K(36.9);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 20 * 365;  units.am = 'd';  label.am = 'life span';                   bibkey.am = 'Sloo1991';   
  temp.am = C2K(36.9); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 90;        units.Lb = 'cm'; label.Lb = 'total length at birth';                bibkey.Lb = 'Sloo1991';
data.Lp = 125;       units.Lp = 'cm'; label.Lp = 'total length at puberty for female';    bibkey.Lp = 'Sloo1991'; 
  comment.Lp = 'read from tL_f curve at tp';
data.Lpm = 137;       units.Lpm = 'cm'; label.Lpm = 'total length at puberty for male';   bibkey.Lpm = 'Sloo1991';
  comment.Lp = 'read from tL_m curve at tpm';
data.Li = 139;       units.Li = 'cm'; label.Li = 'ultimate total length for female';      bibkey.Li = 'Sloo1991';
data.Lim = 126;       units.Lim = 'cm'; label.Lim = 'ultimate total length for male';     bibkey.Lim = 'Sloo1991';

data.Ri = 1/365/2.5;    units.Ri = '#/d';label.Ri = 'maximum reprod rate';         bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(36.9); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 calf each 2 till 3 yr';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), length (cm)
0.063	99.262
0.044	76.983
0.044	79.635
0.042	84.409
0.042	86.001
0.041	87.592
0.041	89.714
0.940	105.459
0.941	108.995
1.944	114.839
1.969	119.082
1.970	120.320
1.993	116.607
2.922	119.975
2.923	122.804
2.924	127.047
2.924	128.992
2.946	118.030
3.902	132.183
3.903	133.775
4.928	132.192
6.932	140.165
7.981	134.870
8.931	128.512
8.936	144.603
9.959	134.886
13.989	139.341
17.040	134.062
18.947	142.919];
data.tL_f(:,1) = (.5 + data.tL_f(:,1)) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f  = C2K(36.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Sloo1991';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), length (cm)
0.088	96.079
0.916	104.575
0.993	119.428
1.014	107.758
1.894	110.948
1.968	113.424
3.947	119.099
5.999	119.470
8.980	129.574
9.029	126.745
10.931	118.097
10.935	132.419
13.009	127.309
14.988	130.332
16.035	120.085
17.966	125.936
19.990	117.643];
data.tL_m(:,1) = (.5 + data.tL_m(:,1)) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m  = C2K(36.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Sloo1991';
comment.tL_m = 'Data for males';

% length-weigth
data.LW_f = [ ...
 76.6  9.5
 79.2 11.3
 84.0 13.5
 86.0 11.3
 90.2 15.6
 99.0 23.5
106.0 25.7
115.0 27.5
117.2 28.5
119.0 18.0
120.0 21.0
120.0 29.9
118.0 31.0
119.0 26.6
122.5 32.0
127.0 33.0
129.0 37.0
129.5 37.5
132.0 41.5
134.0 35.4
134.0 38.0
132.0 42.0
139.6 47.0
128.0 43.0
144.2 48.0
134.6 40.8
139.0 44.0
133.6 45.5
142.5 47.0];
units.LW_f  = {'cm', 'kg'};  label.LW_f = {'length', 'weight', 'female'};  
bibkey.LW_f = 'Sloo1991';
comment.LW_f = 'Data for females';
%
data.LW_m = [ ...
104.6 21.9
107.5 26.5
109.0 26.4
111.0 25.6
113.5 28.4
117.0 31.0
119.2 20.4
113.0 25.7
114.0 28.5
119.0 33.0
119.0 24.5
119.0 30.8
129.0 36.0
127.0 41.5
132.0 37.6
118.5 33.5
125.0 41.5
117.0 31.0];
units.LW_m  = {'cm', 'kg'};  label.LW_m = {'length', 'weight', 'male'};  
bibkey.LW_m = 'Sloo1991';
comment.LW_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 5 * weights.Li;
weights.Lim = 5 * weights.Lim;
 
%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'LW_f','LW_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion points
D1 = 'Males are supposed to differ from females by {p_Am} and E_Hp only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '5XJ6M'; % Cat of Life
metaData.links.id_ITIS = '180452'; % ITIS
metaData.links.id_EoL = '46559321'; % Ency of Life
metaData.links.id_Wiki = 'Cephalorhynchus_hectori'; % Wikipedia
metaData.links.id_ADW = 'Cephalorhynchus_hectori'; % ADW
metaData.links.id_Taxo = '68759'; % Taxonomicon
metaData.links.id_WoRMS = '254979'; % WoRMS
metaData.links.id_MSW3 = '14300040'; % MSW3
metaData.links.id_AnAge = 'Cephalorhynchus_hectori'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Cephalorhynchus_hectori}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Kooy2010'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Kooijman, S.A.L.M.}, ' ...
'year = {2010}, ' ...
'title  = {Dynamic Energy Budget theory for metabolic organisation}, ' ...
'publisher = {Cambridge Univ. Press, Cambridge}, ' ...
'pages = {Table 4.2 (page 150), 8.1 (page 300)}, ' ...
'URL = {../../../bib/Kooy2010.html}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Sloo1991'; type = 'Article'; bib = [ ... 
'author = {E. Slooten}, ' ... 
'year = {1991}, ' ...
'title = {Age, growth, and reproduction in Hector''s dolphins}, ' ...
'journal = {Can. J. Zool.}, ' ...
'volume = {69}, ' ...
'pages = {1689-1700}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/328527/details}}'; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

