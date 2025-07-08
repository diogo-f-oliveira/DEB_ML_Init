function [data, auxData, metaData, txtData, weights] = mydata_Leuresthes_tenuis

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Atheriniformes'; 
metaData.family     = 'Atherinopsidae';
metaData.species    = 'Leuresthes_tenuis'; 
metaData.species_en = 'California grunion'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {'Mp'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L'; 'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 09 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2020 09 14]; 

%% set data
% zero-variate data

data.ab = 14;     units.ab = 'd';    label.ab = 'age at birth'; bibkey.ab = 'fishbase';
  temp.ab = C2K(12); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'temerature is guessed';
data.am = 8*365;   units.am = 'd';    label.am = 'life span';                 bibkey.am = 'fishbase';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 11.5;    units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Clar1925'; 
data.Li  = 19;     units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'fishbase';
 
data.Wwb = 2.1e-3; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';      bibkey.Wwb = 'Clar1925';
  comment.Wwb = 'based of egg diameter of 1.6 mm: pi/6*0.16^3';
data.Wwp = 9.64; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';          bibkey.Wwp = 'fishbase';
  comment.Wwp = 'based on 0.00575*Lp^3.04, see F1';
data.Wwi = 44.4; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';          bibkey.Wwi = 'fishbase';
  comment.Wwi = 'based on 0.00575*Li^3.04, see F1';
  

% uni-variate data
% time-length
data.tL = [ ... time since birth (d), total length (cm)
113.726	8.118
114.419	7.978
181.624	9.425
185.102	8.865
239.580	10.101
240.976	9.938
245.261	10.451
247.363	10.288
256.510	9.961
257.942	10.171
266.445	10.498
266.462	10.684
281.306	10.871
281.354	11.384
324.405	11.221
325.951	12.644
366.043	11.058
366.228	13.017
399.220	11.011
399.403	12.947
424.113	12.947
454.339	11.547
457.301	13.017
365-60.326	11.617
365-58.149	12.247
365-38.464	11.361
365-38.387	12.177
365-34.246	11.174
365-32.709	12.504
365-32.086	11.617
365-31.963	12.924
365-30.599	12.411
365-27.890	11.198
365-25.704	11.921
365-24.208	12.807
365-22.086	12.854
365-18.567	12.737
365-17.150	12.784
365-16.510	12.084
365-16.468	12.527
365-15.749	12.667
365-14.342	12.621
365-13.675	12.201
365-12.239	12.457
365-11.489	12.924
365-7.282	12.621
365-3.085	12.201
365+0.526	13.064
365+71.035	12.107
365+99.278	12.131
365+112.702	12.247
365+184.026	12.434
365+191.178	13.414
365+241.205	12.364
365+242.700	13.250
365+246.248	13.437
365+246.875	12.597
365+263.236	13.904
365+264.531	12.667
365+275.911	13.554
365+280.087	12.924
365+324.580	13.087
365+365.592	13.764
365+408.712	14.347];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'}; 
temp.tL    = C2K(17);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'Clar1925';

% length - weight
data.LWw = [ ... % total length (cm), wet weight (g)
4.990	1.020
6.023	1.276
7.014	2.962
7.832	3.934
8.004	4.129
9.039	6.270
9.039	6.725
9.988	8.672
10.074	9.321
10.980	11.853
10.980	12.243
12.016	15.425
12.017	16.140
12.966	18.997
12.968	20.752
13.959	23.024
14.048	26.144
15.001	31.862
15.042	30.301
15.956	41.090
16.081	36.994];
units.LWw   = {'cm', 'g'};  label.LWw = {'total length','wet weight'}; 
bibkey.LWw = 'Clar1925';

% length - fecundity
data.LN = [ ... % total length (cm), fecundity (#)
    11.8 1613
    13.0 2309
    13.4 2115
    13.5 2117
    14.4 3007
    15.8 3579];
units.LN   = {'cm', '#'};  label.LN = {'total length','fecundity'}; 
temp.LN    = C2K(17);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Clar1925';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.Li = weights.Li * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% facts
F1 = 'length-weight: WW in g = 0.00575 * TL^3.04';
metaData.bibkey.F1 = 'fishbase';
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6Q7BK'; % Cat of Life
metaData.links.id_ITIS = '166014'; % ITIS
metaData.links.id_EoL = '46566581'; % Ency of Life
metaData.links.id_Wiki = 'Leuresthes_tenuis'; % Wikipedia
metaData.links.id_ADW = 'Leuresthes_tenuis'; % ADW
metaData.links.id_Taxo = '44706'; % Taxonomicon
metaData.links.id_WoRMS = '281344'; % WoRMS
metaData.links.id_fishbase = 'Leuresthes-tenuis'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = [...
'howpublished = {\url{https://en.wikipedia.org/wiki/Leuresthes_tenuis}}'];
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
bibkey = 'Clar1925'; type = 'techreport'; bib = [ ...
'howpublished = {\url{https://escholarship.org/uc/item/1q77x56q}}, ' ...
'author = {Frances N. Clark}, ' ... 
'year = {1925}, ' ...
'title = {The Life History of \emph{Leuresthes tenuis}, an Atherine Fish with Tide Controlled Spawning Habits}, ' ...
'institution = {STATE OF CALIFORNIA FISH AND GAME COMMISSION}, ' ...
'volume = {10}, ' ...
'series = {FISH BULLETIN}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = [...
'howpublished = {\url{https://www.fishbase.de/summary/Leuresthes-tenuis.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

