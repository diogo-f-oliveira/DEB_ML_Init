function [data, auxData, metaData, txtData, weights] = mydata_Dugong_dugon
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Sirenia'; 
metaData.family     = 'Dugongidae';
metaData.species    = 'Dugong_dugon'; 
metaData.species_en = 'Dugong'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MIN', 'MPSE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Mv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(33.0); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Lw'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 17];              
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

data.tg = 374; units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(33.0);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 548;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(33.0);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Hein1972: oldest calf netted with mother was 1 yr';
data.tp = 3470;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(33.0);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Hein1972: 2 yr';
data.am = 73*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(33.0);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 110;     units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Hein1972';
data.Lp  = 239;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';   bibkey.Lp  = 'Hein1972';
data.Lpm  = 240;    units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';   bibkey.Lpm  = 'Hein1972';
data.Li  = 305;    units.Li  = 'cm';  label.Li  = 'ultimate total length for females'; bibkey.Li  = 'Hein1972';
data.Lim = 270;    units.Lim = 'cm';  label.Lim = 'ultimate total length for males';   bibkey.Lim  = 'Hein1972';

data.Wwb = 27.5e3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwi = 519e3;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';     bibkey.Wwi = 'AnAge';
  comment.Wwi = 'based on (Li/Lim)^3*Wwim; that weight 360 kg corresponds with length 2.7 m is based on (Lim/Lb)^3 simeq Wwim/Wwb'; 
data.Wwim = 360e3;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for male';     bibkey.Wwim = {'Hein1972','AnAge'};

data.Ri  = 0.2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(33.0); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.am = '1 calf per litter, 0.2 litters per yr; ADW 1 calf each 2.5 till 7 yr';

% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr), length (cm)
0.146	140.944
0.229	127.823
0.230	125.323
0.534	139.398
1.072	150.984
1.297	169.432
1.299	162.869
1.383	149.123
3.989	217.050
4.456	213.007
4.852	192.712
5.151	219.600
6.005	215.888
7.016	209.057
8.164	242.545
8.167	235.357
8.633	234.128
8.941	238.829
9.016	245.082
9.024	226.332
9.330	235.721
9.331	232.283
11.033	241.420
12.037	250.839
12.497	261.797
12.578	254.300
13.272	263.081
13.439	234.650
14.051	252.490
16.991	265.743
19.702	270.862
20.627	284.027
22.115	248.155
24.354	270.440
26.447	270.532
27.066	273.684
27.132	300.562
36.215	269.709
39.237	270.779
45.750	268.877];
data.tL_f(:,1) = 365 * data.tL_f(:,1); % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'length', 'female'};  
temp.tL_f   = C2K(33.0);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Mars1980';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), length (cm)
0.072	131.878
1.063	170.672
1.521	187.254
1.536	153.192
1.601	182.258
1.607	167.570
1.910	185.709
2.291	199.475
5.457	227.739
6.083	215.891
6.698	227.168
8.788	234.134
9.415	218.849
9.954	226.061
10.413	241.393
10.569	238.900
11.339	250.809
12.664	234.304
13.139	210.575
13.278	247.456
14.056	242.802
14.592	256.263
15.449	247.238
15.519	264.741
16.996	256.056
22.570	271.612
24.443	242.632
29.159	273.463
31.258	258.555
32.112	257.030];
data.tL_m(:,1) = 365 * data.tL_m(:,1); % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'length', 'male'};  
temp.tL_m   = C2K(33.0);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Mars1980';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

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
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2);  

%% Facts
F1 = 'constant replacement of molar teeth, unique among mammals';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '37ZY2'; % Cat of Life
metaData.links.id_ITIS = '180679'; % ITIS
metaData.links.id_EoL = '46559229'; % Ency of Life
metaData.links.id_Wiki = 'Dugong_dugon'; % Wikipedia
metaData.links.id_ADW = 'Dugong_dugon'; % ADW
metaData.links.id_Taxo = '69403'; % Taxonomicon
metaData.links.id_WoRMS = '220227'; % WoRMS
metaData.links.id_MSW3 = '11600005'; % MSW3
metaData.links.id_AnAge = 'Dugong_dugon'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Dugong_dugon}}';
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
bibkey = 'Hein1972'; type = 'Article'; bib = [ ... 
'author = {G. E. Heinsohn}, ' ... 
'year = {1972}, ' ...
'title = {A Study of Dugongs (\emph{Dugong dugong}) in {N}orthern {Q}ueensland, {A}ustralia}, ' ...
'journal = {Biological Conservation}, ' ...
'volume = {4}, ' ...
'number = {3}, '...
'pages = {205--213}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mars1980'; type = 'Article'; bib = [ ... 
'author = {Marsh, H.}, ' ... 
'year = {1980}, ' ...
'title = {Age Determination of the Dugong (\emph{Dugong dugon} ({M}\"{u}ller)) in {N}orthern {A}ustralia and its Biological Implications}, ' ...
'journal = {REP. INT. WHAL. COMMN}, ' ...
'volume = {special issue 3}, '...
'pages = {181--201}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Dugong_dugon}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

