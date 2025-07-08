function [data, auxData, metaData, txtData, weights] = mydata_Callionymus_filamentosus
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Callionymiformes'; 
metaData.family     = 'Callionymidae';
metaData.species    = 'Callionymus_filamentosus'; 
metaData.species_en = 'Blotchfin dragonet'; 

metaData.ecoCode.climate = {'MA','MB'};
metaData.ecoCode.ecozone = {'MIN','MPSW'};
metaData.ecoCode.habitat = {'bjMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 't-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 02 25];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 02 25];

%% set data
% zero-variate data
data.ab = 5.5; units.ab = 'd';    label.ab = 'age at birth';           bibkey.ab = 'guess';   
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 7*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'ErguErgu2016';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 10;     units.Lp = 'cm';   label.Lp = 'total length at puberty'; bibkey.Lp = 'guess';
  comment.Lp = 'based on C. lyra';
data.Li = 20;  units.Li = 'cm';   label.Li = 'ultimate total length for females';  bibkey.Li = 'fishbase';

data.Wwb = 5.1e-5;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.46 mm of C.lyra: pi/6*0.046^3';
data.Wwp = 6.6;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01148*Lp^2.76, see F1';
data.Wwi = 44.75;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01148*Li^2.76, see F1';

data.GSI = 0.065; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(24); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on C.lyra, GSI is 0.02, but 2 spawnings per yr';

% uni-variate data

% time-length-weight
data.tLW = [ ... % time since hatch (yr), total length (cm)
0  8.35  5.97
1 11.23 12.70
2 13.96 18.15
3 14.51 24.14
4 16.33 32.92
5 17.35 40.77];
data.tLW(:,1) = (1.6 + data.tLW(:,1)) * 365; % convert yr to d
units.tLW = {'d', 'cm', 'g'};  label.tLW = {'time since birth', 'total length', 'weight'};  
treat.tLW = {1, {'total length','weight'}};
temp.tLW = C2K(24);  units.temp.tLW = 'K'; label.temp.tLW = 'temperature';
bibkey.tLW = 'ErguErgu2016';

% length-weight
data.LW_f = [ ... % total length(cm), weight (g)
7.412	3.845
7.540	3.418
7.891	4.415
8.275	4.415
8.435	4.699
8.882	6.693
9.042	6.123
9.073	7.120
9.265	7.120
9.329	8.402
9.617	7.405
9.968	7.975
10.032	9.541
10.256	10.538
10.288	11.677
10.543	10.538
10.863	12.389
10.990	10.823
11.118	11.962
11.150	13.244
11.374	14.098
11.534	13.386
11.725	13.956
12.013	14.383
12.077	15.380
12.173	16.946
12.396	16.377
12.396	17.373
12.652	16.519
12.907	18.940
12.971	17.231
13.003	18.513
13.195	19.509
13.387	19.937
13.450	19.082
13.642	21.076
13.834	21.361
14.058	22.358
14.089	20.934
14.345	22.927
14.441	24.636
14.665	25.775
14.856	25.206
14.888	26.630
14.984	25.348
15.080	26.630
15.144	27.627
15.240	27.911
15.463	28.054
15.591	29.763
16.262	31.329
16.486	34.462
16.741	35.886
17.188	39.589];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length', 'wet weight','females'};  
bibkey.LW_f = 'ErguErgu2016';
%
data.LW_m = [ ... % total length(cm), weight (g)
7.061	3.583
7.220	3.583
8.307	4.729
8.498	5.303
8.978	7.166
9.297	7.452
9.361	8.025
9.553	7.309
9.681	9.745
9.712	8.312
9.840	7.596
10.096	9.459
10.128	10.748
10.288	11.322
10.351	10.175
10.543	10.748
10.703	11.608
10.831	10.892
10.927	11.895
10.958	12.611
11.086	12.325
11.118	13.041
11.342	13.758
11.565	13.471
11.725	14.475
11.853	15.908
11.885	14.904
12.077	16.624
12.300	15.908
12.396	16.768
12.492	18.057
12.620	16.911
12.684	18.917
12.748	17.914
12.812	18.631
12.812	17.054
13.003	19.777
13.195	19.920
13.355	20.637
13.355	19.490
13.546	20.637
13.738	21.067
13.898	21.927
14.058	23.647
14.153	22.930
14.249	24.363
14.377	24.936
14.728	25.223
14.856	26.083
14.952	27.516
15.304	29.666
15.431	29.092
15.815	30.239
16.102	33.822
16.134	33.535
16.134	31.385
16.645	35.111
17.348	41.990];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length', 'wet weight','males'};  
bibkey.LW_m = 'ErguErgu2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tLW = weights.tLW * 5;
weights.ab = weights.ab * 0;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
auxData.treat = treat;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LW_f','LW_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'males are assumed not to differ from females';
D2 = 'I had to add a yr to age estimates in tLW data';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01148*(TL in cm)^2.76'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'PR6Q'; % Cat of Life
metaData.links.id_ITIS = '171713'; % ITIS
metaData.links.id_EoL = ''; % Ency of Life
metaData.links.id_Wiki = 'Callionymus_filamentosus'; % Wikipedia
metaData.links.id_ADW = 'Callionymus_filamentosus'; % ADW
metaData.links.id_Taxo = '165123'; % Taxonomicon
metaData.links.id_WoRMS = '126791'; % WoRMS
metaData.links.id_fishbase = 'Callionymus-filamentosus'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Callionymus_filamentosus}}';  
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
bibkey = 'ErguErgu2016'; type = 'Article'; bib = [ ...
'author = {Deniz Erguden and Sibel Alagoz erguden and Okan Ozdemir}, ' ...
'year = {2016}, ' ...
'title = {Age, growth and mortality of the Red Sea invasive blotchfin dragonet, \emph{Callionymus filamentosus} {V}alenciennes, 1837 from the {N}ortheastern {M}editerranean, {T}urkey}, ' ... 
'journal = {Cah. Biol. Mar.}, ' ...
'volume = {57}, '...
'pages = {17-23}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Callionymus-filamentosus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

