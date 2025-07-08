function [data, auxData, metaData, txtData, weights] = mydata_Chlorurus_perspicillatus
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Labriformes'; 
metaData.family     = 'Scaridae';
metaData.species    = 'Chlorurus_perspicillatus'; 
metaData.species_en = 'Spectacled parrotfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPh'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'Hsff'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22.9); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 11 27];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 11 27];

%% set data
% zero-variate data

data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'DeMaAndr2018';   
  temp.am = C2K(22.9);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 27.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'fishbase'; 
data.Li  = 60.9;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.75 mm of Chaetodon: 4/3*pi*0.038^3'; 
data.Wwp = 67; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'fishbase','guess'};
  comment.Wwp = 'based on 0.01380*Li^3.03, see F1';
data.Wwi = 3.5e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01380*Li^3.03, see F1; max published weight 7 kg';

data.GSI = 0.04; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(22.9); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Hipposcarus_longiceps';

% uni-variate data
data.tL_f = [ ... % time since birth (yr), fork length (cm)
1.658	29.066
1.864	30.371
1.913	25.253
1.915	29.282
1.939	26.451
1.942	32.004
1.966	27.757
1.988	20.461
1.989	21.006
2.121	30.370
2.298	24.271
2.379	31.784
2.406	34.615
2.556	25.576
2.636	33.416
2.714	35.049
2.738	30.584
2.892	29.168
2.944	32.325
2.945	34.612
2.993	24.703
2.994	25.574
2.995	31.127
2.997	35.483
3.099	33.631
3.253	32.324
3.302	26.988
3.328	28.948
3.329	30.581
3.356	33.848
3.615	37.004
3.661	25.897
3.691	34.717
3.692	37.548
3.714	28.510
3.740	29.163
3.741	30.579
3.921	32.211
3.922	35.151
3.923	37.111
3.947	33.082
3.948	34.171
3.972	31.340
4.001	38.962
4.078	37.982
4.335	38.525
4.360	35.802
4.410	32.317
4.411	35.040
4.566	36.781
4.669	36.889
4.670	39.503
4.693	32.534
4.848	34.819
4.952	37.215
4.953	38.739
5.001	33.185
5.079	34.383
5.082	41.134
5.259	35.688
5.389	37.321
5.416	39.934
5.439	33.836
5.621	39.715
5.748	35.141
5.982	42.436
6.342	43.305
6.727	41.234
7.060	38.619
7.629	45.149
8.113	36.435
8.115	41.662
11.047	43.715
11.407	44.584
11.691	46.107
12.024	44.799
12.385	47.737
16.830	41.070
19.095	46.720];
data.tL_f(:,1) = 365*(0+data.tL_f(:,1)); % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'fork length', 'females'};  
temp.tL_f    = C2K(22.9);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'DeMaAndr2018'; 
%
data.tL_m = [ ... % time since birth (yr), fork length (cm)
2.483	34.723
2.690	39.405
2.766	34.831
2.869	37.335
2.972	36.354
2.973	38.641
3.025	39.294
3.026	40.383
3.255	38.095
3.360	41.252
3.386	43.212
3.591	41.904
3.642	39.617
3.643	42.557
3.693	40.706
3.951	42.338
3.952	43.971
4.002	41.140
4.028	41.684
4.133	45.495
4.261	46.256
4.647	45.274
4.724	45.818
4.748	42.551
4.982	48.321
5.009	49.955
5.033	46.470
5.370	53.111
5.624	45.813
6.063	51.038
6.602	48.748
7.529	52.772
7.608	57.019
8.737	52.657
8.814	51.241
8.841	55.270
9.019	51.240
9.765	51.018
10.074	52.758
10.178	55.371
10.434	52.648
10.795	55.695
11.104	57.544
12.414	53.508
13.108	53.395
15.139	54.473
19.175	53.471];
data.tL_m(:,1) = 365*(0+data.tL_m(:,1)); % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'fork length', 'males'};  
temp.tL_m    = C2K(22.9);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'DeMaAndr2018'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 5 * weights.tL_f;
weights.tL_m = 5 * weights.tL_m;
weights.Li = 5 * weights.Li;
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
metaData.discussion = struct('D1',D1);  

%% Facts
F1 = 'weight-length relationship: W in g = 0.01380*(TL in cm)^3.03';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '69Z8M'; % Cat of Life
metaData.links.id_ITIS = '614618'; % ITIS
metaData.links.id_EoL = '46572692'; % Ency of Life
metaData.links.id_Wiki = 'Chlorurus_perspicillatus'; % Wikipedia
metaData.links.id_ADW = 'Chlorurus_perspicillatus'; % ADW
metaData.links.id_Taxo = '170927'; % Taxonomicon
metaData.links.id_WoRMS = '277509'; % WoRMS
metaData.links.id_fishbase = 'Chlorurus-perspicillatus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished170927 = {\url{http://en.wikipedia.org/wiki/Chlorurus_perspicillatus}}';
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
bibkey = 'DeMaAndr2018'; type = 'Article'; bib = [ ... 
'doi = {10.1139/cjfas-2016-0523}, ' ...
'author = {DeMartini, E.E. and A.H. Andrews and K.G. Howard and B.M. Taylor and D.C. Lou and M.K. Donovan}, ' ... 
'year = {2018}, ' ...
'title = {Comparative growth, age at maturity and sex change, and longevity of {H}awaiian parrotfishes, with bomb radiocarbon validation}, ' ...
'journal = {Can. J. Fish. Aquat. Sci.}, ' ...
'volume = {75(4)}, ' ...
'pages = {580-589}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.de/summary/Chlorurus-perspicillatus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

