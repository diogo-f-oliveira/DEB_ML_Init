function [data, auxData, metaData, txtData, weights] = mydata_Panopea_abbreviata

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Adapedonta'; 
metaData.family     = 'Hiatellidae';
metaData.species    = 'Panopea_abbreviata'; 
metaData.species_en = 'Southern geoduck'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MASW'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPp', 'jiHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 12 28];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 12 28]; 

%% set data
% zero-variate data

data.ab = 1;     units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(18);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 146*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'MorsCioc2004';   
  temp.am = C2K(18);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp  = 3.9; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'guess';
  comment.Lp = 'based on same relative length, compared to Mya arenaria: (2.34/15)*Li';
data.Li  = 25;   units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'MorsCioc2004';

data.Wwb = 2.8e-6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 200 mum: pi/9*0.02^3'; 
data.Wwi = 3e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'MorsCioc2004';

data.Ri  = 1.5e8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'guess';   
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.8, found for Mya arenaria'; 

% uni-variate data

% t-L data
data.tL = [ ... % time since birth (a), shell length (cm)
1.869	5.317
1.871	4.968
2.728	5.608
2.781	6.683
2.891	7.757
2.898	5.986
3.808	7.758
3.809	7.497
3.809	7.380
3.810	7.090
3.928	6.480
3.988	5.638
4.041	6.684
4.787	6.539
4.842	7.033
4.843	6.742
4.899	7.265
4.952	8.078
4.954	7.817
4.954	7.730
4.955	7.527
5.009	8.311
5.922	9.125
5.924	8.776
5.925	8.544
5.927	8.079
5.931	7.062
6.724	9.300
6.727	8.544
6.730	7.760
6.951	9.794
8.100	9.039
8.732	8.836
9.017	9.214
10.048	9.360
10.049	9.070
10.848	9.796
11.710	9.216
11.880	9.739
11.881	9.478
11.990	10.698
12.850	10.727
12.852	10.292
12.912	9.653
12.913	9.246
12.917	8.375
13.772	9.421
13.885	9.857
13.888	9.131
13.939	10.554
14.859	9.944
14.860	9.712
14.861	9.451
14.862	9.189
15.947	10.032
15.948	9.829
15.949	9.597
15.951	9.219
16.854	12.589
16.921	10.062
16.922	9.830
16.923	9.685
16.924	9.336
17.953	10.005
17.955	9.540
18.757	9.628
18.870	9.947
20.016	10.064
21.854	8.962
21.964	10.153
22.826	9.660
22.938	10.299
22.939	10.067
24.486	9.922
24.941	10.881
25.921	9.488
26.835	10.186
27.924	10.128
28.784	10.071
29.815	10.072
31.929	11.758
34.848	12.631
38.009	10.426
39.044	9.439];
data.tL(:,1) = 365 * data.tL(:,1); % convert a to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'shell length'};  
temp.tL    = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MorsCioc2004';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1);

%% Links
metaData.links.id_CoL = '4CG5J'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '46473283'; % Ency of Life
metaData.links.id_Wiki = 'Panopea'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3974020'; % Taxonomicon
metaData.links.id_WoRMS = '505404'; % WoRMS
metaData.links.id_molluscabase = '505404'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Panopea (bivalve)}}';
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
bibkey = 'MorsCioc2004'; type = 'Article'; bib = [ ... 
'author = {Enrique Mors\''{a}n and N\''{e}stor F. Ciocco}, ' ... 
'year = {2004}, ' ...
'title = {Age and growth model for the southern geoduck, \emph{Panopea abbreviata}, off {P}uerto {L}obos ({P}atagonia, {A}rgentina)}, ' ...
'journal = {Fisheries Research}, ' ...
'volume = {69}, ' ...
'pages = {343-348}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

