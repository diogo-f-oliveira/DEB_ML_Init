  function [data, auxData, metaData, txtData, weights] = mydata_Minytrema_melanops

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Minytrema_melanops'; 
metaData.species_en = 'Spotted sucker'; 

metaData.ecoCode.climate = {'Cfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 03];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 03]; 

%% set data
% zero-variate data
data.am = 8*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'GrabYoun2012';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 29;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'GrabYoun2012'; 
  comment.Lp = 'based on tp 3-4 yr, and tL data';
data.Li = 50;    units.Li = 'cm'; label.Li = 'ultimate total length';           bibkey.Li = 'fishbase';

data.Wwb = 5.8e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';             bibkey.Wwb = 'GrabYoun2012';
  comment.Wwb = 'based on egg weight';
data.Wwi = 1.28e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';  bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^3.00, see F1';

data.Ri = 25.5*1.28e3/365;   units.Ri = '#/d';  label.Ri = 'max Reprod rate';    bibkey.Ri = 'GrabYoun2012';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on mean # eggs per weight';

% univariate data

% time-length
data.tL = [ ... % year class (yr), total length (cm)
0.936	15.443
0.938	16.962
0.941	19.241
0.944	21.266
1.008	7.342
1.009	8.101
1.010	8.861
1.012	10.886
1.016	13.418
1.934	16.203
1.937	18.481
1.987	24.304
1.990	26.835
1.992	28.608
2.011	12.152
2.023	20.506
2.025	22.278
2.037	30.633
2.042	34.177
2.932	16.709
3.023	22.532
3.025	24.304
3.028	26.329
3.029	27.342
3.037	32.658
3.039	34.177
3.041	35.949
3.044	37.975
3.072	28.354
3.074	29.873
3.076	31.139
3.910	33.671
3.913	35.190
3.940	24.810
3.943	26.835
3.958	37.722
3.975	20.000
3.991	31.899
4.003	40.506
4.027	28.101
4.051	45.316
4.072	30.127
4.900	28.354
4.995	36.962
5.004	43.291
5.019	24.051
5.027	29.620
5.052	47.848
5.071	31.899
5.074	33.671
5.076	35.443
5.081	38.734
5.084	41.013
5.855	27.595
5.983	30.633
5.998	41.519
6.002	43.797
6.010	49.620
6.034	37.468
6.037	39.494
6.047	46.329
6.068	31.899
6.071	33.671
6.071	33.924
6.073	35.443
6.075	36.456
6.963	48.354
6.983	32.152
6.985	33.924
6.988	36.203
7.033	38.734
7.044	46.835
7.053	52.911
7.077	40.253
7.079	42.025
7.081	43.544
7.125	45.063
7.943	35.949
7.945	36.962
7.948	38.987
7.992	41.013
8.036	42.532
8.038	44.051
8.046	49.873
8.083	46.835
8.085	48.354
8.946	39.747
8.948	41.519
8.985	37.975
9.034	43.544
9.066	36.709
9.078	45.316
9.088	52.405
10.003	53.418
10.027	41.013
10.030	42.785
10.068	40.000
10.073	44.051
10.076	45.823
10.105	36.709
10.107	38.481
10.983	40.759
10.985	42.532
10.986	43.291
11.031	45.570
11.034	47.848
11.063	38.734
12.021	40.506
12.023	41.772
12.027	44.810
12.029	46.582
12.075	49.620
12.978	42.025
13.022	43.797
13.158	51.392
14.020	44.304];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'GrabYoun2012';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'length-weight: Ww in g = 0.01023 * (TL in cm)^3.00'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '43KQY'; % Cat of Life
metaData.links.id_ITIS = '163959'; % ITIS
metaData.links.id_EoL = '212095'; % Ency of Life
metaData.links.id_Wiki = 'Minytrema_melanops'; % Wikipedia
metaData.links.id_ADW = 'Minytrema_melanops'; % ADW
metaData.links.id_Taxo = '180159'; % Taxonomicon
metaData.links.id_WoRMS = '1022836'; % WoRMS
metaData.links.id_fishbase = 'Minytrema-melanops'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Minytrema_melanops}}';  
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
bibkey = 'GrabYoun2012'; type = 'Article'; bib = [ ...  
'author = {Timothy B. Grabowski and Shawn P. Young and J. Jeffery Isely and Patrick C. Ely}, ' ...
'year = {2012}, ' ...
'title = {Age, Growth, and Reproductive Biology of Three {C}atostomids From the {A}palachicola {R}iver, {F}lorida}, ' ... 
'journal = {Journal of Fish and Wildlife Management}, ' ...
'volume = {3(2)}, '...
'pages = {223-237}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Minytrema-melanops.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

