function [data, auxData, metaData, txtData, weights] = mydata_Chaetodon_marleyi
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Chaetodontiformes'; 
metaData.family     = 'Chaetodontidae';
metaData.species    = 'Chaetodon_marleyi'; 
metaData.species_en = 'Doublesash butterflyfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPSW','MINE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjPz', 'jiCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(28.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2024 09 30];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 09 30];

%% set data
% zero-variate data

data.ab = 7;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'guess';   
  temp.ab = C2K(28.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(28.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lp  = 10.5; units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Vine1998'; 
data.Li  = 18;  units.Li  = 'cm';  label.Li  = 'ultimate total length'; bibkey.Li  = 'fishbase';

data.Wwb = 2.3e-4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based egg diameter of 0.75 mm of Cheatodon larvatus: pi/6*0.075^3'; 
data.Wwp = 27.7; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'guess','fishbase'};
  comment.Wwp = 'based on 0.02570*Lp^2.97, see F1';
data.Wwi = 137.4; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.02570*Li^2.97, see F1';

data.GSI  = 0.06;   units.GSI  = '-'; label.GSI  = 'gonado somatic index';   bibkey.GSI  = 'guess';   
  temp.GSI = C2K(28.5);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  comment.GSI = 'based on Cheatodon larvatus';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (yr), total length (g)
0.487	5.457
0.500	5.835
0.501	6.623
0.502	6.875
0.627	7.002
0.992	7.919
1.012	7.288
1.988	7.547
1.996	9.942
2.002	7.988
2.993	13.732
2.998	9.539
3.006	12.029
3.019	11.494
3.994	9.766
4.002	13.360];
data.tL(:,1) = 365 * (0.2+data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL    = C2K(28.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Vine1998';

% length-weight
data.LW = [ ... % total length (cm), weight (g)
3.417	1.016
3.714	1.016
3.900	1.829
4.364	2.642
4.476	3.252
4.885	4.878
5.126	3.049
5.257	4.878
5.516	4.472
5.609	4.675
5.703	5.691
5.814	5.691
6.353	7.317
6.409	8.130
6.594	7.114
6.614	8.130
6.837	8.740
6.968	10.772
7.097	8.943
7.209	9.756
7.211	13.618
7.415	13.211
7.469	10.772
7.544	13.008
7.581	12.398
7.750	14.837
7.897	12.805
8.010	14.634
8.344	15.244
8.438	17.886
8.607	20.122
8.718	20.325
8.886	21.545
8.977	18.089
8.978	21.138
9.278	25.813
9.463	25.000
9.671	31.301
9.928	26.829
10.434	34.350
11.125	42.276
11.517	46.341
11.576	51.220
11.985	53.252
12.304	58.333
12.700	70.732
13.018	74.593
13.367	67.073
13.726	79.472
13.805	88.211];
units.LW   = {'cm', 'g'};  label.LW = {'total length','weight'};  
bibkey.LW = 'Vine1998';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Li = 3 * weights.Li;
weights.Wwi = 3 * weights.Wwi;
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'weight-length relationship: W in g = 0.02570*(TL in cm)^2.97';
metaData.bibkey.F1 = 'fishbase'; 
F2 = 'Marine; reef-associated; depth range 3 - 12 m';
metaData.bibkey.F2 = 'fishbase'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = 'TBZH'; % Cat of Life
metaData.links.id_ITIS = '169600'; % ITIS
metaData.links.id_EoL = '46578235'; % Ency of Life
metaData.links.id_Wiki = 'Chaetodon_marleyi'; % Wikipedia
metaData.links.id_ADW = 'Chaetodon_marleyi'; % ADW
metaData.links.id_Taxo = '170380'; % Taxonomicon
metaData.links.id_WoRMS = '218755'; % WoRMS
metaData.links.id_fishbase = 'Chaetodon-marleyi'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Chaetodon_marleyi}}';
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
bibkey = 'Vine1998'; type = 'phdthesis'; bib = [ ... 
'howpublished = {\url{https://commons.ru.ac.za/vital/access/manager/Repository/vital:21103?site_name=Rhodes+University}}, ' ...
'author = {Vine, Niall Gordon}, ' ... 
'year = {1998}, ' ...
'title = {Aspects of the biology of the doublesash butterflyfish, \emph{Chaetodon marleyi} ({P}isces: {C}haetodontidae)}, ' ...
'school = {Rhodes University, Faculty of Science, Ichthyology and Fisheries Science}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Chaetodon-marleyi.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
