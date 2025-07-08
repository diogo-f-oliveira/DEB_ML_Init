function [data, auxData, metaData, txtData, weights] = mydata_Galeus_melastomus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Chondrichthyes'; 
metaData.order      = 'Carcharhiniformes'; 
metaData.family     = 'Scyliorhinidae';
metaData.species    = 'Galeus_melastomus'; 
metaData.species_en = 'Blackmouth catshark'; 

metaData.ecoCode.climate = {'MB';'MC'};
metaData.ecoCode.ecozone = {'MAW','MAm'};
metaData.ecoCode.habitat = {'0iMcp'};
metaData.ecoCode.embryo  = {'Ms'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(10.3); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm  = [2020 10 31];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 03 30];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 03 30];

%% set data
% zero-variate data
data.ab = 0.9*365;    units.ab = 'd';   label.ab = 'age at birth';            bibkey.ab = 'guess';    
  temp.ab = C2K(10.3);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 17*365;    units.am = 'd';    label.am = 'life span';          bibkey.am = 'BaptCoel2010';   
  temp.am = C2K(10.3); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 15;       units.Lb  = 'cm';  label.Lb  = 'total length at birth'; bibkey.Lb  = 'BaptCoel2010';  
data.Lp  = 56;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'fishbase'; 
data.Li  = 90;      units.Li  = 'cm';  label.Li  = 'ultimate total length for females';    bibkey.Li  = 'fishbase';
data.Lim  = 75;    units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';    bibkey.Lim  = 'fishbase';

data.Wwi = 1.2e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight (female)';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00275*Li^3.01, see F1';

data.Ri  = 20/365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'fishbase';   
  temp.Ri = C2K(10.3); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% uni-variate data
 
% time - length
data.tL_f = [ ... % time since birth (yr), total length (cm)
0.000	18.871
0.001	12.420
0.002	13.387
0.003	16.291
0.004	18.065
0.005	15.807
0.006	19.839
1.015	16.622
2.993	30.995
2.994	31.640
2.995	32.930
2.996	35.511
3.019	39.059
4.002	34.068
4.003	35.358
4.004	36.326
4.046	37.294
4.948	40.689
4.949	41.819
4.989	35.851
4.990	39.077
4.991	39.883
5.956	41.666
5.957	42.795
5.958	44.086
5.976	38.763
5.997	37.796
6.000	45.376
6.985	44.095
6.986	44.901
7.972	47.168
7.973	48.459
7.974	49.588
7.975	50.555
7.976	51.362
8.015	46.523
8.963	56.371
9.003	52.016
9.024	51.210
9.044	46.855
9.045	47.662
9.046	50.404
9.047	53.468
9.991	57.025
9.992	57.993
10.011	52.670
10.012	54.445
10.013	55.251
11.039	52.518
11.040	53.163
11.041	55.260
11.042	56.389
11.043	57.518
11.044	60.099
12.030	62.527
12.050	59.947
12.051	61.076
12.070	56.076
13.014	59.149
13.015	60.117
13.016	62.213
13.017	62.859
13.018	64.149
13.019	64.794
13.039	65.923
14.002	65.125
14.003	65.932
14.045	64.158
14.066	63.352
15.032	66.586
15.033	67.877
15.074	65.458
15.998	70.627
16.019	68.853
16.039	67.563
17.069	70.637];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'total length', 'female'};  
temp.tL_f    = C2K(10.3);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f  = 'BaptCoel2010';
comment.tL_f = 'Data for females';
%
data.tL_m = [ ... % time since birth (yr), total length (cm)
0.000	21.291
0.001	14.033
0.002	14.678
0.997	23.073
1.060	21.945
2.007	29.373
4.002	34.875
4.004	37.455
4.991	41.174
5.053	35.690
5.054	36.658
6.062	39.732
6.108	46.506
6.987	48.127
6.988	49.740
7.048	40.870
7.049	42.160
7.050	43.289
8.040	53.782
8.060	52.008
9.005	54.758
9.024	49.436
10.077	56.058
11.064	59.131
12.047	53.818
12.048	54.463
12.070	58.011
13.035	58.181
13.144	61.569
14.021	59.158
14.023	62.706];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'total length', 'male'};  
temp.tL_m    = C2K(10.3);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m  = 'BaptCoel2010';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 3 * weights.tL_f;
weights.tL_m = 3 * weights.tL_m;

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
D1 = 'males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Facts
F1 = 'length-weight: Ww in g  = 0.00275 * (TL in cm)^3.01';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3F4Y9'; % Cat of Life
metaData.links.id_ITIS = '160034'; % ITIS
metaData.links.id_EoL = '46560072'; % Ency of Life
metaData.links.id_Wiki = 'Galeus_melastomus'; % Wikipedia
metaData.links.id_ADW = 'Galeus_melastomus'; % ADW
metaData.links.id_Taxo = '106376'; % Taxonomicon
metaData.links.id_WoRMS = '105812'; % WoRMS
metaData.links.id_fishbase = 'Galeus-melastomus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Galeus_melastomus}}';
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
bibkey = 'BaptCoel2010'; type = 'techreport'; bib = [ ... 
'author = {Miguel Baptista and Rui Coelhoa and Ivone Figueiredob and Karim Erzinic}, ' ... 
'year = {2010}, ' ...
'title = {DETERMINATION OF AGE AND GROWTH OF \emph{Galeus melastomus}, {R}AFINESQUE, 1810, A DEEPWATER SHARK, USING A MODIFICATION TO THE COBALT NITRATE TECHNIQUE}, ' ...
'institution = {ICES CM 2010/E:40}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Galeus-melastomus.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

