  function [data, auxData, metaData, txtData, weights] = mydata_Romanogobio_albipinnatus

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Cypriniformes'; 
metaData.family     = 'Leuciscidae';
metaData.species    = 'Romanogobio_albipinnatus'; 
metaData.species_en = 'White-finned gudgeon'; 

metaData.ecoCode.climate = {'Dwa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(16); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'};  
metaData.data_1     = {'t-Ww_T'; 'T-ab'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};        
metaData.date_subm = [2019 03 17];                           
metaData.email    = {'bas.kooijman@vu.nl'};                 
metaData.address  = {'VU University Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 03 17]; 

%% set data
% zero-variate data
data.am = 5*365;   units.am = 'd';  label.am = 'life span';                       bibkey.am = 'fishbase';   
  temp.am = C2K(16); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5.3;  units.Lp = 'cm'; label.Lp = 'total length at puberty for females';  bibkey.Lp = 'guess'; 
  comment.Lp = 'based on the same relative length, compared to Gobio gobio: 13*8.5/21';
data.Li = 13;    units.Li = 'cm'; label.Li = 'ultimate total length';              bibkey.Li = 'fishbase';

data.Wwb = 1.8e-3;  units.Wwb = 'g';  label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'WanzWanz1993';
  comment.Wwb = 'Based on egg diameter of 1.5 mm: pi/6*0.15^3';

data.Ri = 6830/365;   units.Ri = '#/d';  label.Ri = 'Reprod rate max size';        bibkey.Ri = 'guess';
  temp.Ri = C2K(16); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on kap = 0.99, as found for Gobio gobio';

% univariate data
% time-length
data.tL20 = [ ... % time since birth (d), total length (cm)
3.679	0.611
10.269	0.842
19.952	1.312
22.619	1.455
27.541	1.838
34.712	2.384
43.967	2.729
48.875	2.912
55.738	3.056
62.346	3.554
70.756	3.804
76.492	3.834
83.783	4.103
91.780	4.448
98.929	4.679
107.210	5.100];
units.tL20 = {'d', 'cm'}; label.tL20 = {'time since birth', 'length', '20 C'};  
temp.tL20 = C2K(20);  units.temp.tL20 = 'K'; label.temp.tL20 = 'temperature';
bibkey.tL20 = 'WanzWanz1993';
%
% time-length
data.tL16 = [ ... % time since birth (yr), total length (cm)
2.422	0.630
5.362	0.679
8.442	0.727
12.647	0.852
15.873	0.977
20.917	1.112
25.686	1.303
33.689	1.754
55.006	2.579];
units.tL16 = {'d', 'cm'}; label.tL16 = {'time since birth', 'length', '16 C'};  
temp.tL16 = C2K(16);  units.temp.tL16 = 'K'; label.temp.tL16 = 'temperature';
bibkey.tL16 = 'WanzWanz1993';

% time-weight
data.tW20 = [ ... % time since birth (yr),  wet weight (g)
3.44956	0.00083
10.76289	0.00271
19.76744	0.01256
23.00063	0.02057
27.77933	0.04191
34.79415	0.09193
43.88702	0.14803
48.91476	0.16239
56.17775	0.18828
62.89848	0.30297
70.72139	0.36437
76.85924	0.35199
83.70892	0.45519
91.95484	0.59972
98.80099	0.72105
106.90385	0.88320];
units.tW20 = {'d', 'g'}; label.tW20 = {'time since birth', 'wet weight', '20 C'};  
temp.tW20 = C2K(20);  units.temp.tW20 = 'K'; label.temp.tW20 = 'temperature';
bibkey.tW20 = 'WanzWanz1993';
%
data.tW16 = [ ... % time since birth (yr),  wet weight (g)
2.61234	0.00083
5.13461	0.00103
9.06990	0.00185
13.14032	0.00303
15.81271	0.00469
20.85812	0.00741
25.90618	0.01236
33.62929	0.03374
54.47857	0.11300];
units.tW16 = {'d', 'g'}; label.tW16 = {'time since birth', 'wet weight', '16 C'};  
temp.tW16 = C2K(16);  units.temp.tW16 = 'K'; label.temp.tW16 = 'temperature';
bibkey.tW16 = 'WanzWanz1993';

data.Tab = [ ... %temperature (C), incubation time (d)
12.020	12.549
15.990	7.983
20.025	5.342
24.050	3.899];
units.Tab = {'C', 'd'}; label.Tab = {'temperature', 'incubation time'};  
bibkey.Tab = 'WanzWanz1993';


%% set weights for all real data
weights = setweights(data, []);
weights.tL20 = 5* weights.tL20;
weights.tL16 = 5* weights.tL16;
weights.Ri = 0 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL20', 'tL16'}; subtitle1 = {'Data at 20, 16 C'};
set2 = {'tW20', 'tW16'}; subtitle2 = {'Data at 20, 16 C'};
metaData.grp.sets = {set1,set2};
metaData.grp.subtitle = {subtitle1,subtitle2};

%% Facts
F1 = 'Length-weight: Ww (in g) = 0.00575*(TL in cm)^3.14';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6WWMC'; % Cat of Life
metaData.links.id_ITIS = '689975'; % ITIS
metaData.links.id_EoL = '209781'; % Ency of Life
metaData.links.id_Wiki = 'Romanogobio_albipinnatus'; % Wikipedia
metaData.links.id_ADW = 'Romanogobio_albipinnatus'; % ADW
metaData.links.id_Taxo = '567493'; % Taxonomicon
metaData.links.id_WoRMS = '1015653'; % WoRMS
metaData.links.id_fishbase = 'Romanogobio-albipinnatus'; % fishbase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Romanogobio_albipinnatus}}';  
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
bibkey = 'WanzWanz1993'; type = 'Article'; bib = [ ...  
'author = {Wanzenb\"{o}ck and S. Wanzenb\"{o}ck}, ' ...
'year = {1993}, ' ...
'title = {Temperature effetcs on incubation  time and growth of juvenile whitefin gudgeon, \emph{Gobio albipinnatus} {L}ukash}, ' ... 
'journal = {Journal of Fish Biology}, ' ...
'volume = {42}, '...
'pages = {35-46}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.fishbase.se/summary/Romanogobio-albipinnatus.html}}';  
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
