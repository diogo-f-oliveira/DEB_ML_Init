function [data, auxData, metaData, txtData, weights] = mydata_Antechinus_flavipes

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Dasyuromorphia'; 
metaData.family     = 'Dasyuridae';
metaData.species    = 'Antechinus_flavipes'; 
metaData.species_en = 'Yellow-footed antechinus'; 

metaData.ecoCode.climate = {'BSh','BSk','Cfa','Cfb'};
metaData.ecoCode.ecozone = {'TA'};
metaData.ecoCode.habitat = {'0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb';'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 11];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 11];

%% set data
% zero-variate data

data.tg = 31.5;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'Marl1961';   
  temp.tg = C2K(35);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 90;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'Marl1961';   
  temp.tx = C2K(35);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 320;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'Marl1961';
  temp.tp = C2K(35);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 3.9*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 0.0164;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Marl1961';
data.Wwi = 45;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'AnAge';

data.Ri  = 6.8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Marl1961';   
  temp.Ri = C2K(35);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data

% time-length
data.tL_f = [ ... % time (d), head+body length (cm)
0.813	0.525
5.688	0.768
8.125	0.848
14.219	0.929
19.094	1.091
21.937	1.333
34.125	3.071
43.062	4.646
43.469	3.071
50.375	4.364
56.062	5.131
63.375	5.535
71.094	5.576
78.000	6.020
84.500	6.909
91.406	7.111
99.125	7.717
106.031	8.040
112.531	8.525
120.250	8.525
127.156	8.687
132.844	8.525
146.656	8.889
160.875	9.010
175.094	8.768
188.906	8.889
202.719	8.768
209.625	8.848
224.250	9.333
238.875	9.131
251.875	9.010];
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'head+body length'};  
temp.tL_f  = C2K(35);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Marl1961';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time (d), head+body length (cm)
24.375	1.253
28.031	1.778
36.156	3.394
36.156	2.707
43.062	3.354
45.094	4.444
48.750	4.808
50.781	4.000
56.469	4.929
58.500	4.485
63.375	5.818
71.906	5.980
78.000	6.384
84.906	7.556
92.625	8.242
99.531	8.606
106.437	8.848
112.938	9.051
120.250	9.010
126.750	9.212
133.656	9.455
147.875	9.899
160.875	10.020
175.500	9.737
188.500	10.424
203.125	9.859
210.844	10.303
224.250	10.424
237.250	10.465
251.875	10.626];
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'head+body length'};  
temp.tL_m  = C2K(35);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Marl1961';
comment.tL_m = 'Data for males';

% time-weight
data.tWw_f = [ ... % time (d), weight^(1/3) (g^(1/3))
60.288	1.443
70.277	1.582
71.863	2.079
77.525	2.151
80.236	1.906
84.852	2.244
89.877	2.138
92.179	2.343
98.844	2.402
99.534	2.270
105.847	2.435
113.842	2.528
120.175	2.581
127.518	2.581
134.853	2.627
142.194	2.633
147.863	2.666
155.197	2.719
162.199	2.758
169.868	2.805
176.544	2.798
183.561	2.751
190.233	2.771
196.594	2.652
204.255	2.744
211.268	2.724
217.937	2.757
225.290	2.697
231.284	2.783
239.645	2.677
245.982	2.703
252.663	2.670
259.315	2.809
266.322	2.822
280.679	2.789
290.026	2.782];
data.tWw_f(:,2) = data.tWw_f(:,2).^3; % remove transformation
units.tWw_f  = {'d', 'g'};  label.tWw_f = {'time since birth', 'wet weight', 'female'};  
temp.tWw_f  = C2K(35);  units.temp.tWw_f = 'K'; label.temp.tWw_f = 'temperature';
bibkey.tWw_f = 'Marl1961';
comment.tWw_f = 'Data for females';
%
data.tWw_m = [ ... % time (d), weight^(1/3) (g^(1/3))
49.964	1.304
71.184	2.152
78.836	2.297
85.160	2.403
92.824	2.475
99.152	2.555
106.817	2.627
113.143	2.720
120.480	2.753
127.161	2.720
134.488	2.812
141.498	2.805
148.500	2.845
155.171	2.871
162.504	2.931
168.839	2.970
175.169	3.036
183.173	3.076
189.501	3.155
197.534	3.022
203.197	3.089
211.221	3.002
218.222	3.055
225.238	3.009
231.237	3.061
238.940	2.902
245.925	3.048
252.613	2.968
259.272	3.067
266.923	3.219
280.620	3.146
291.306	3.113];
data.tWw_m(:,2) = data.tWw_m(:,2).^3; % remove transformation
units.tWw_m  = {'d', 'g'};  label.tWw_m = {'time since birth', 'wet weight', 'male'};  
temp.tWw_m  = C2K(35);  units.temp.tWw_m = 'K'; label.temp.tWw_m = 'temperature';
bibkey.tWw_m = 'Marl1961';
comment.tWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw_f = 5 * weights.tWw_f;
weights.tWw_m = 5 * weights.tWw_m;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tWw_f','tWw_m'}; subtitle2 = {'Data for females, males'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Discussion
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Links
metaData.links.id_CoL = '66XSM'; % Cat of Life
metaData.links.id_ITIS = '552594'; % ITIS
metaData.links.id_EoL = '323715'; % Ency of Life
metaData.links.id_Wiki = 'Antechinus_flavipes'; % Wikipedia
metaData.links.id_ADW = 'Antechinus_flavipes'; % ADW
metaData.links.id_Taxo = '59915'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '10800055'; % MSW3
metaData.links.id_AnAge = 'Antechinus_flavipes'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Antechinus_flavipes}}';
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
bibkey = 'Marl1961'; type = 'Article'; bib = [ ... 
'doi = {10.1071/zo9610203}, ' ...
'author = {Marlow, B. J.}, ' ... 
'year = {1961}, ' ...
'title = {Reproductive Behaviour of the Marsupial Mouse, \emph{Antechinus flavipes} ({W}aterhouse) ({M}arsupialia) and the development of the Pouch young}, ' ...
'journal = {Australian Journal of Zoology}, ' ...
'volume = {9(2)}, ' ...
'pages = {203-220}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Antechinus_flavipes}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

