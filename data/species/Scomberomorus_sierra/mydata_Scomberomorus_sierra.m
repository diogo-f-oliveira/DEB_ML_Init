function [data, auxData, metaData, txtData, weights] = mydata_Scomberomorus_sierra
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Scombriformes'; 
metaData.family     = 'Scombridae';
metaData.species    = 'Scomberomorus_sierra'; 
metaData.species_en = 'Pacific sierra'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMcp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'bjPz', 'jiCi', 'jiCvf'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25.8); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2019 04 26];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 04 26];

%% set data
% zero-variate data

data.tp = 2*365;    units.tp = 'd';   label.tp = 'age at puberty';           bibkey.tp = 'ChalGove1999';
  temp.tp = C2K(25.8);units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 5*365;   units.am = 'd';   label.am = 'life span';                 bibkey.am = 'ChalGove1999';   
  temp.am = C2K(25.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 59.3;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'LucaRuiz2011'; 
data.Li  = 99;     units.Li  = 'cm';  label.Li  = 'ultimate fork length';    bibkey.Li  = 'fishbase';

data.Wwb = 6.5e-5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 mm for Scomberomorus_commerson: pi/6*0.05^3';

data.GSI = 0.3 ; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';      bibkey.GSI = 'LucaRuiz2011'; 
temp.GSI = C2K(25.8);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data

% t-L data
data.tL = [ ... % yr class (yr), total length (cm)
    1 29.73
    2 49.92
    3 64.01
    4 73.83
    5 80.69
    6 85.47
    7 88.81
    8 91.14
    9 92.76
   10 93.89]; 
data.tL(:,1) = data.tL(:,1) * 365;   % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'fork length'};  
temp.tL    = C2K(25.8);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'NavaEspi2012';

% length-weight data
data.LW = [ ... % total length (cm), wet weight (g)
29.706	200.000
29.708	129.412
30.892	270.588
32.080	305.883
32.083	200.000
32.933	152.941
34.117	294.118
34.290	176.471
35.645	294.118
35.646	258.824
35.987	211.765
37.342	317.647
38.193	247.059
38.868	400.000
38.871	305.883
39.721	258.824
40.056	435.294
41.246	352.941
41.752	482.353
43.108	552.941
43.113	376.471
44.128	517.647
44.640	435.294
44.806	564.706
45.998	435.294
46.157	800.000
46.506	494.118
46.672	623.530
47.861	588.236
48.197	717.647
48.203	505.883
49.721	870.589
50.065	705.883
50.238	576.471
51.595	635.294
51.760	800.000
51.762	729.412
51.925	952.941
52.940	1105.883
53.287	835.294
54.139	729.412
54.813	917.647
54.980	1011.765
56.508	1023.530
57.021	882.353
57.524	1117.647
58.040	858.824
58.708	1247.059
58.715	1011.765
59.049	1200.000
59.735	976.471
60.071	1105.883
60.582	1035.294
60.747	1200.000
61.253	1317.647
62.446	1141.177
62.778	1411.765
63.454	1541.176
64.476	1411.765
64.806	1741.176
66.332	1823.529
66.513	1435.294
66.677	1623.530
66.846	1658.824
67.018	1600.000
67.189	1529.412
67.519	1882.353
68.540	1788.235
68.712	1717.647
68.889	1447.059
69.057	1541.176
69.389	1788.235
69.570	1411.765
69.724	1952.941
69.733	1647.059
70.577	1823.529
70.920	1670.588
71.585	2176.471
72.109	1682.353
72.774	2176.471
72.780	1952.941
73.630	1905.883
73.634	1764.706
73.788	2341.177
73.792	2200.000
73.795	2094.118
74.649	1917.647
75.322	2117.647
75.479	2576.471
75.649	2552.941
75.996	2294.118
76.162	2423.529
76.339	2176.471
77.521	2423.529
77.523	2329.412
77.854	2635.294
78.367	2505.882
80.571	2611.765
81.229	3376.471
81.920	2964.706
82.260	2929.412
82.592	3200.000
83.098	3317.647
83.103	3129.412
83.268	3317.647
83.281	2847.059
87.507	3494.118
88.707	3105.882
96.451	5435.294];
units.LW   = {'cm', 'g'};  label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'NavaEspi2012';

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

%% Discussion
D1 = 'Temeratures are guessed, based on fishbase for preferred temperature';
metaData.discussion = struct('D1',D1);  

%% Links
metaData.links.id_CoL = '4VTXS'; % Cat of Life
metaData.links.id_ITIS = '172440'; % ITIS
metaData.links.id_EoL = '46577330'; % Ency of Life
metaData.links.id_Wiki = 'Scomberomorus_sierra'; % Wikipedia
metaData.links.id_ADW = 'Scomberomorus_sierra'; % ADW
metaData.links.id_Taxo = '187079'; % Taxonomicon
metaData.links.id_WoRMS = '273821'; % WoRMS
metaData.links.id_fishbase = 'Scomberomorus-sierra'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Scomberomorus_sierra}}';
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
bibkey = 'LucaRuiz2011'; type = 'Article'; bib = [ ... 
'doi = {10.7773/cm.v37i3.1892}, ' ...
'author = {G. Lucano-Ram\''{i}rez and S. Ruiz-Ram\''{i}rez and F. I. Palomera-S\''{a}nchez and G. Gonz\''{a}lez-Sans\''{o}n}, ' ... 
'year = {2011}, ' ...
'title = {Reproductive biology of the {P}acific sierra \emph{Scomberomorus sierra} ({P}isces, {S}combridae) in the central {M}exican {P}acific}, ' ...
'journal = {Ciencias Marinas}, ' ...
'volume = {37}, ' ...
'pages = {249-260}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'NavaEspi2012'; type = 'Article'; bib = [ ... 
'doi = {10.4067/S0718-19572012000200009}, ' ...
'author = {Rub\''{i} A. Nava-Ortega and Elaine Espino-Barr and Manuel Gallardo-Cabello and  Arturo Garcia-Boa and Marcos Puente-G\''{o}mez and Esther G. Cabral-Sol\''{i}s}, ' ... 
'year = {2012}, ' ...
'title = {Growth analysis of the {P}acific sierra \emph{Scomberomorus sierra} in {C}olima, M\''{e}xico}, ' ...
'journal = {Revista de Biolog\''{i}a Marina y Oceanograf\''{i}a}, ' ...
'volume = {47}, ' ...
'pages = {273-281}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.se/summary/Scomberomorus-sierra.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
