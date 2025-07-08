  function [data, auxData, metaData, txtData, weights] = mydata_Carpiodes_carpio

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Catostomidae';
metaData.species    = 'Carpiodes_carpio'; 
metaData.species_en = 'River carpsucker'; 

metaData.ecoCode.climate = {'BSk','Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi','biHl'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(18); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};        
metaData.date_subm = [2020 08 31];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 08 31]; 

%% set data
% zero-variate data
data.am = 10*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(18); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 30.5;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'Morr1965'; 
data.Li = 64;    units.Li = 'cm'; label.Li = 'ultimate total length';             bibkey.Li = 'fishbase';

data.Wwb = 3.6e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'fishesoftexas';
  comment.Wwb = 'based on egg diameter 1.7-2.1 mm: pi/6*0.19^3';
data.Wwp = 307; units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';          bibkey.Wwp = {'fishbase','Morr1965'};
  comment.Wwp = 'based on 0.01047*Lp^3.01, see F1';
data.Wwi = 2.86e3; units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';            bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.01047*Li^3.01, see F1';

data.Ri = 195700/365;   units.Ri = '#/d';  label.Ri = 'max Reprod rate';    bibkey.Ri = 'fishbase';
  temp.Ri = C2K(18); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% univariate data

% time-length
data.tL = [ ... % year class (yr), total length (cm)
    1 10.0
    2 20.9
    3 24.3
    4 27.5
    5 30.7
    6 33.2
    7 42.4];
data.tL(:,1) = data.tL(:,1) * 365; % convert yr to d
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(18);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Morr1965';

% length-weight
data.LWw = [ ... % total length (cm), wet weight (g)
7.387	9.194
8.672	15.822
9.407	15.868
10.051	9.360
10.417	18.113
11.244	15.982
12.162	22.587
12.804	26.992
13.994	51.074
15.189	46.784
16.472	64.324
17.481	75.300
18.579	99.376
19.497	105.981
20.227	134.400
21.605	136.668
22.609	173.834
23.343	178.245
24.165	204.486
25.450	211.114
26.269	256.999
27.646	265.815
28.562	283.332
29.106	322.652
30.293	366.376
31.204	412.267
32.296	473.446
32.668	447.279
35.577	630.793
36.303	687.585
42.044	962.943];
units.LWw = {'cm', 'g'}; label.LWw = {'total length','wet weight'};  
bibkey.LWw = 'Morr1965';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 20 * weights.tL;
weights.Wwb = 3 * weights.Wwb;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;
weights.psd.p_M = 5 * weights.psd.p_M;

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
F1 = 'length-weight: Ww in g = 0.01047 * (TL in cm)^3.01'; 
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'RG63'; % Cat of Life
metaData.links.id_ITIS = '163919'; % ITIS
metaData.links.id_EoL = '994727'; % Ency of Life
metaData.links.id_Wiki = 'Carpiodes_carpio'; % Wikipedia
metaData.links.id_ADW = 'Carpiodes_carpio'; % ADW
metaData.links.id_Taxo = '165567'; % Taxonomicon
metaData.links.id_WoRMS = '890545'; % WoRMS
metaData.links.id_fishbase = 'Carpiodes-carpio'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Carpiodes_carpio}}';  
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
bibkey = 'Morr1965'; type = 'Article'; bib = [ ...  
'author = {Larry A. Morris}, ' ...
'year = {1965}, ' ...
'title = {Age and Growth of the River Carpsucker, \emph{Carpiodes carpio}, in the {M}issouri {R}iver}, ' ... 
'journal = {The American Midland Naturalist}, ' ...
'volume = {73(2)}, '...
'pages = {423-429}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Carpiodes-cyprinus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishesoftexas'; type = 'Misc'; bib = ...
'howpublished = {\url{http://txstate.fishesoftexas.org/carpiodes carpio.htm}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

