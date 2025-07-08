function [data, auxData, metaData, txtData, weights] = mydata_Panthera_leo

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Felidae';
metaData.species    = 'Panthera_leo'; 
metaData.species_en = 'Lion'; 

metaData.ecoCode.climate = {'Am', 'BS'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTg', '0iTs', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvm', 'xiSvm'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.9); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 10 13];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 10 15];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2018 07 25];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.author_mod_3   = {'Bas Kooijman'};    
metaData.date_mod_3     = [2023 04 12];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 12];

%% set data
% zero-variate data

data.tg = 109;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.9);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 216;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.9);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 1095;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.9);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 27*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 157;    units.Li  = 'cm';  label.Li  = 'ultimate head-body length for female'; bibkey.Li  = 'Wiki';
  comment.Li = '140 - 175 cm';
data.Lim  = 210;   units.Lim  = 'cm'; label.Lim  = 'ultimate head-body length for male';  bibkey.Lim  = 'Wiki';
  comment.Lim = '170 - 250 cm';

data.Wwb = 1300;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 8480;   units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 160e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '81.7 and 90 kg recorded, 160 kg from tW_f';
data.Wwim = 250e3; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight';    bibkey.Wwim = 'Wiki';

data.Ri  = 3/649;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.9);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time since birth (yr), female body weight (g)
0.230	13948.812
0.675	50072.589
0.735	40204.037
0.812	45950.440
0.981	71414.440
1.089	75514.233
1.103	59896.488
1.104	73047.095
1.165	83726.407
1.640	108340.575
1.655	102585.771
1.747	107508.883
1.853	90238.918
3.000	109038.278
3.001	123832.733
3.353	137773.200
3.368	122155.425
3.599	155011.041
4.165	180438.761
4.637	136834.062
4.821	145036.439
5.079	110492.351
5.094	120353.926
5.736	128514.441
6.594	164600.512
6.900	177723.241
8.610	144690.378];
data.tW_f(:,1) = data.tW_f(:,1) * 365; % convert yr to d
units.tW_f = {'d', 'g'};  label.tW_f = {'time since birth', 'wet weight', 'female'};  
temp.tW_f  = C2K(37.9);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Eras2008';
comment.tW_f = 'Data for females from 4 sites in the Free State Province of South Africa';
%
data.tW_m = [ ... % time since birth (yr), male body weight (g)
0.240	9756.099
0.254	17073.174
0.672	82926.846
0.734	47967.449
0.793	60975.622
0.808	55284.524
1.031	100000.020
1.047	83739.834
1.107	82113.798
1.136	120325.178
1.136	108130.053
1.151	115447.128
1.392	98373.983
1.631	130894.295
1.826	127642.252
1.843	91869.897
1.901	138211.370
2.140	171544.700
2.140	157723.569
2.141	142276.401
2.156	147967.469
2.169	183739.824
2.171	155284.544
2.965	186991.867
2.966	169105.675
3.234	232520.322
3.327	171544.700
3.341	190243.881
3.867	187804.856
4.063	165040.643
4.543	177235.768
4.812	216260.166];
data.tW_m(:,1) = data.tW_m(:,1) * 365; % convert yr to d
units.tW_m = {'d', 'g'};  label.tW_m = {'time since birth', 'wet weight', 'male'};  
temp.tW_m  = C2K(37.9);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Eras2008';
comment.tW_m = 'Data for males from 4 sites in the Free State Province of South Africa';

data.tW_1f = [ ... % time since birth (yr), female body weight (kg)
0.000	1.300
0.940	47.270
1.957	89.984
2.985	116.350
3.950	124.077
5.032	124.595
6.077	125.868
7.005	132.449
8.013	132.197
9.010	120.536
10.012	130.169
11.005	123.831
12.050	123.583
12.991	111.915];
data.tW_1f(:,1) = data.tW_1f(:,1) * 365; % convert yr to d
data.tW_1f(:,2) = data.tW_1f(:,2) * 1e3; % convert kg to g
units.tW_1f = {'d', 'g'};  label.tW_1f = {'time since birth', 'wet weight', 'female'};  
temp.tW_1f  = C2K(37.9);  units.temp.tW_1f = 'K'; label.temp.tW_1f = 'temperature';
bibkey.tW_1f = 'SmutRobi2009';
comment.tW_1f = 'Data for females from Kruger Park';
%
data.tW_1m = [ ... % time since birth (yr), male body weight (g)
0.000	1.300
0.932	59.816
1.963	109.757
2.925	150.183
3.961	164.383
4.977	180.101
5.987	177.567
7.001	195.947
7.999	183.526
8.990	179.849
10.016	208.876];
data.tW_1m(:,1) = data.tW_1m(:,1) * 365; % convert yr to d
data.tW_1m(:,2) = data.tW_1m(:,2) * 1e3; % convert kg to g
units.tW_1m = {'d', 'g'};  label.tW_1m = {'time since birth', 'wet weight', 'male'};  
temp.tW_1m  = C2K(37.9);  units.temp.tW_1m = 'K'; label.temp.tW_1m = 'temperature';
bibkey.tW_1m = 'SmutRobi2009';
comment.tW_1m = 'Data for males from Kruger Park';
  
%% set weights for all real data
weights = setweights(data, []);
weights.Wwx = 0 * weights.Wwx;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'Data for females, males'};
set2 = {'tW_1f','tW_1m'}; subtitle2 = {'Data for females, males from Kruger Park'};
metaData.grp.sets = {set1, set2};
metaData.grp.subtitle = {subtitle1, subtitle2};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Mod_2 ignores Wwx; v that is now more consistent with other cats, and MRE dropped from 0.1 till 0.05';
D3 = 'mod_3: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '4CGXP'; % Cat of Life
metaData.links.id_ITIS = '183803'; % ITIS
metaData.links.id_EoL = '328672'; % Ency of Life
metaData.links.id_Wiki = 'Panthera_leo'; % Wikipedia
metaData.links.id_ADW = 'Panthera_leo'; % ADW
metaData.links.id_Taxo = '67265'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14000228'; % MSW3
metaData.links.id_AnAge = 'Panthera_leo'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Panthera_leo}}';
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
bibkey = 'Eras2008'; type = 'Phdthesis'; bib = [ ... 
'author = {H. L. Erasmus}, ' ... 
'year = {2008}, ' ...
'title = {Determination of some blood parameters in the {A}frican lion (\emph{Panthera leo})}, ' ...
'school = {University of the Free State}, ' ...
'howpublished = {\url{http://etd.uovs.ac.za/ETD-db/theses/available/etd-09062010-120804/unrestricted/ErasmusHL.pdf}}, ' ...
'address = {Bloemfontein}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SmutRobi2009'; type = 'article'; bib = [ ... 
'doi = {10.1111/j.1469-7998.1980.tb01433.x}, ' ...
'author = {Smuts, G. L. and Robinson, G. A. and Whyte, I. J.}, ' ... 
'year = {2009}, ' ...
'title = {Comparative growth of wild male and female lions (\emph{Panthera leo})}, ' ...
'journal = {Journal of Zoology}, ' ...
'volume = {190(3)}, ' ...
'pages = {365–373}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Panthera_leo}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

