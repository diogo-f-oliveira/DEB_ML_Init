function [data, auxData, metaData, txtData, weights] = mydata_Synchiropus_phaeton
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Callionymiformes'; 
metaData.family     = 'Callionymidae';
metaData.species    = 'Synchiropus_phaeton'; 
metaData.species_en = 'Phaeton dragonet'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAE','MAm'};
metaData.ecoCode.habitat = {'bjMp','jiMd'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(13.8); % K, body temp
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
  temp.ab = C2K(13.8);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8*365; units.am = 'd';    label.am = 'life span';              bibkey.am = 'BasuOzca2020';   
  temp.am = C2K(13.8);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on tL data';

data.Lp = 7.2;     units.Lp = 'cm';   label.Lp = 'total length at puberty'; bibkey.Lp = 'guess';
  comment.Lp = 'based on C. lyra: 10*18/25';
data.Li = 18;  units.Li = 'cm';   label.Li = 'ultimate total length for females';  bibkey.Li = 'fishbase';

data.Wwb = 5.1e-5;  units.Wwb = 'g';    label.Wwb = 'wet weight at birth';    bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.46 mm of Callionymus_lyra: pi/6*0.046^3';
data.Wwp = 2.2;   units.Wwp = 'g';    label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.01023*Lp^2.72, see F1';
data.Wwi = 26.6;   units.Wwi = 'g';    label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01023*Li^2.72, see F1';

data.GSI = 0.065; units.GSI = 'g/g';  label.GSI = 'gonado somatic index';    bibkey.GSI = 'guess';
  temp.GSI = C2K(13.8); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Callionymus_lyra, GSI is 0.02, but 2 spawnings per yr';

% uni-variate data

% time-length
data.tL_fm = [ ... % time since hatch (yr), total length (cm)
2  7.00  8.70
3 10.06  9.83
4 13.57 13.72
5 16.23 16.05
6 17.25 17.28
7 18.28 18.39];
data.tL_fm(:,1) = (0.8 + data.tL_fm(:,1)) * 365; % convert yr to d
units.tL_fm = {'d', 'cm'};  label.tL_fm = {'time since birth', 'total length'};  
treat.tL_fm = {1, {'females','males'}};
temp.tL_fm = C2K(13.8);  units.temp.tL_fm = 'K'; label.temp.tL_fm = 'temperature';
bibkey.tL_fm = 'BasuOzca2020';

% time-weight
data.tW_fm = [ ... % time since hatch (yr), weight (g)
    2  2.01  3.16
    3  4.34  3.65
    4  9.73 10.04
    5 14.82 14.13
    6 16.49 17.14
    7 19.80 20.42];
data.tW_fm(:,1) = (0.8 + data.tW_fm(:,1)) * 365; % convert yr to d
units.tW_fm = {'d', 'g'};  label.tW_fm = {'time since birth', 'weight'};  
treat.tW_fm = {1, {'females','males'}};
temp.tW_fm = C2K(13.8);  units.temp.tW_fm = 'K'; label.temp.tW_fm = 'temperature';
bibkey.tW_fm = 'BasuOzca2020';

% length-weight
data.LW_f = [ ... % total length(cm), weight (g)
7.148	2.107
9.040	2.776
9.249	2.569
9.723	3.085
10.148	5.155
10.724	4.584
10.884	5.878
10.986	4.170
11.409	5.359
11.515	5.980
11.516	6.550
11.670	4.945
11.780	7.274
11.782	8.309
11.939	7.843
12.198	6.134
12.411	7.583
12.459	5.461
12.619	6.392
12.674	7.945
12.782	9.135
13.046	9.652
13.153	10.946
13.201	8.565
13.259	11.256
13.415	10.635
13.470	11.722
13.517	9.082
13.784	10.945
13.835	10.323
13.884	8.512
13.945	12.549
14.048	11.979
14.309	10.892
14.359	10.012
14.362	11.202
14.363	11.564
14.471	12.962
14.522	12.289
14.734	13.116
14.895	14.980
14.941	11.615
14.941	11.977
15.051	14.099
15.150	11.097
15.153	12.546
15.259	13.167
15.571	11.924
15.680	13.529
15.731	12.700
15.841	15.029
15.894	15.392
15.942	13.218
15.943	13.890
16.098	12.441
16.152	13.062
16.154	14.408
16.160	17.099
16.267	17.772
16.316	16.478
16.363	13.579
16.524	15.235
16.528	17.357
16.574	14.355
16.578	16.063
16.737	16.684
16.949	17.615
16.996	15.027
17.051	16.114
17.204	14.147
17.315	17.045
17.320	19.012
17.370	18.080
17.627	15.336
17.629	16.371
17.635	19.270
17.684	17.510
17.786	15.802
17.848	20.615
18.107	19.010
18.269	21.132
18.370	19.217
18.532	20.924];
units.LW_f   = {'cm', 'g'};  label.LW_f = {'total length', 'wet weight','females'};  
bibkey.LW_f = 'BasuOzca2020';
%
data.LW_m = [ ... % total length(cm), weight (g)
8.621	3.166
8.671	4.127
9.038	4.848
9.146	3.164
9.148	2.202
9.512	3.825
9.514	2.983
9.879	4.485
10.824	4.844
10.930	4.062
11.137	6.045
11.137	5.685
11.345	6.826
11.559	4.902
12.082	5.863
12.134	6.464
12.236	7.966
12.394	7.605
12.550	8.928
12.606	6.463
12.653	9.769
12.971	8.145
13.229	10.730
13.390	9.166
13.598	10.188
13.646	12.652
13.701	11.390
13.807	10.728
13.963	11.870
13.967	9.465
14.121	11.569
14.381	13.132
14.386	10.005
14.644	12.470
14.647	11.027
14.745	14.874
14.855	11.928
14.910	10.485
15.061	14.453
15.274	12.649
15.277	11.085
15.483	13.490
15.533	14.872
15.591	11.686
15.692	13.970
15.747	12.587
15.956	13.188
15.999	18.539
16.109	15.833
16.164	14.510
16.320	15.171
16.421	17.696
16.423	16.493
16.847	14.148
16.897	15.891
16.898	14.929
17.000	17.093
17.311	19.437
17.370	15.469
17.471	17.874
17.472	17.092
17.730	19.977
17.837	18.955
17.990	21.480
18.148	20.938
18.256	19.495
18.520	18.713
18.567	21.538
18.882	21.898
];
units.LW_m   = {'cm', 'g'};  label.LW_m = {'total length', 'wet weight','males'};  
bibkey.LW_m = 'BasuOzca2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_fm = weights.tL_fm * 3;
weights.tW_fm = weights.tW_fm * 3;
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
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.01023*(TL in cm)^2.72'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7B8VX'; % Cat of Life
metaData.links.id_ITIS = '642542'; % ITIS
metaData.links.id_EoL = '46571361'; % Ency of Life
metaData.links.id_Wiki = 'Synchiropus_phaeton'; % Wikipedia
metaData.links.id_ADW = 'Synchiropus_phaeton'; % ADW
metaData.links.id_Taxo = '188567'; % Taxonomicon
metaData.links.id_WoRMS = '126798'; % WoRMS
metaData.links.id_fishbase = 'Synchiropus-phaeton'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/wiki/Synchiropus_phaeton}}';  
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
bibkey = 'BasuOzca2020'; type = 'Article'; bib = [ ...
'doi = {10.3750/AIEP/02711}, ' ...
'author = {Asiye Ba\c{s}usta and Ebru I. Ozcan and Nuri Ba\c{s}usta}, ' ...
'year = {2020}, ' ...
'title = {AGE AND GROWTH OF THE PHAETON DRAGONET, \emph{Synchiropus phaeton} ({A}CTINOPTERYGII: {P}ERCIFORMES: {C}ALLIONYMIDAE), FROM THE {G}ULF OF {I}SKENDERUN, NORTH-EASTERN {M}EDITERRANEAN, {T}URKEY}, ' ... 
'journal = {Acta Ichthyologica et Piscatoria}, ' ...
'volume = {50(1)}, '...
'pages = {63–70}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Synchiropus-phaeton.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

