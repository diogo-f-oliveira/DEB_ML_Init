function [data, auxData, metaData, txtData, weights] = mydata_Krefftichthys_anderssoni
%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Actinopterygii'; 
metaData.order      = 'Myctophiformes'; 
metaData.family     = 'Myctophidae';
metaData.species    = 'Krefftichthys_anderssoni'; 
metaData.species_en = 'Rhombic lanternfish'; 

metaData.ecoCode.climate = {'MA', 'MB', 'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0jMpe', 'jiMp'};
metaData.ecoCode.embryo  = {'Mpe'};
metaData.ecoCode.migrate = {'Mo'};
metaData.ecoCode.food    = {'biPz'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(3.1); % in K, body temp
metaData.data_0     = {'aj'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'t-L';'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author    = {'Bas Kooijman'};    
metaData.date_subm = [2024 05 31];              
metaData.email     = {'bas.kooijman@vu.nl'};            
metaData.address   = {'VU University Amsterdam'};  

metaData.curator     = {'Dina Lika'};
metaData.email_cur   = {'lika@uoc.gr'}; 
metaData.date_acc    = [2024 05 31];

%% set data
% zero-variate data
data.am = 3*365; units.am = 'd';    label.am = 'life span';                   bibkey.am = 'SaunLour2020';  
  temp.am = C2K(3.1); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lp = 5.0;   units.Lp = 'cm';   label.Lp = 'standard length at puberty';  bibkey.Lp = 'guess';
  comment.Lp = 'based on Electrona antarctica: 0.7*7.1 cm';
data.Li = 7.1;   units.Li = 'cm';   label.Li = 'ultimate standard length';    bibkey.Li = 'fishbase';

data.Wwb = 6.5e-5; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 0.5 mm of Benthosema_suborbitale: pi/6*0.05^3';
data.Wwp = 1.07; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';      bibkey.Wwp = {'Gart1993','fishbase'};  
  comment.Wwp = 'based on 0.00692*Lp^3.13, see F3';
data.Wwi = 3.2;  units.Wwi = 'g';   label.Wwi = 'ultimate female wet weight'; bibkey.Wwi = {'Gart1993','fishbase'};     
  comment.Wwi = 'based on 0.00692*Li^3.13, see F3';
  
data.Ri  = 4.4e3/365; units.Ri  = '#/d'; label.Ri  = 'max reprod rate';         bibkey.Ri  = 'guess';   
  temp.Ri = C2K(3.1);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on fecundity of Benthosema_suborbitale: 400*(7.1/3.2)^3';

% uni-variate data
% time-length
data.tL = [ ... % time since birth (d), standard length (cm) 
0.471	3.578
0.480	2.683
0.481	3.448
0.490	3.205
0.491	3.746
0.498	2.422
0.780	3.334
0.789	3.726
0.790	4.304
0.791	4.416
0.798	3.539
0.799	3.614
0.808	3.912
0.809	4.080
0.968	4.732
0.989	6.261
0.996	4.900
0.997	5.235
0.998	6.392
1.005	4.359
1.006	5.068
1.007	5.515
1.008	6.503
1.014	4.154
1.016	5.385
1.035	5.608
1.499	3.499
1.500	3.704
1.501	5.811
1.502	6.035
1.503	6.688
1.504	6.800
1.510	4.282
1.511	5.662
1.512	6.408
1.790	4.281
1.791	5.754
1.792	5.922
1.793	6.071
1.800	4.635
1.802	6.462
1.808	4.057
1.818	3.889
1.820	6.257
1.827	3.740
1.978	5.175
2.005	5.790
2.006	5.939
2.007	6.107
2.008	6.219
2.009	6.704
2.017	6.536
2.025	5.585
2.036	6.872
2.492	5.378
2.502	5.657
2.503	6.776
2.504	6.944
2.511	5.545
2.512	6.310
2.522	6.515
2.523	7.074
2.791	4.910
2.810	5.712
2.811	5.861
2.812	6.514
2.821	6.700
2.829	6.029
2.830	6.234
2.831	7.110];
data.tL(:,1) = 365 * data.tL(:,1);
units.tL = {'d', 'cm'}; label.tL = {'time since birth', 'standard length'};  
temp.tL = C2K(3.1);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SaunLour2020';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5*weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Length-Weight relationship: W in g =  0.00692*(TL in cm)^3.13';
metaData.bibkey.F1 = 'fishbase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6NMNF'; % Cat of Life
metaData.links.id_ITIS = '623731'; % ITIS
metaData.links.id_EoL = '46564304'; % Ency of Life
metaData.links.id_Wiki = 'Krefftichthys_anderssoni'; % Wikipedia
metaData.links.id_ADW = 'Krefftichthys_anderssoni'; % ADW
metaData.links.id_Taxo = '177802'; % Taxonomicon
metaData.links.id_WoRMS = '234641'; % WoRMS
metaData.links.id_fishbase = 'Krefftichthys-anderssoni'; % fishbase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Krefftichthys_anderssoni}}';
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
bibkey = 'SaunLour2020'; type = 'article'; bib = [ ...
'doi = {10.1111/jfb.14206}, ' ...
'author = {Ryan A. Saunders and Silvia Louren\c{c}o and Rui P. Vieira and Martin A. Collins and Carlos A. Assis and Jose C. Xavier}, ' ... 
'year   = {2020}, ' ...
'title  = {Age and growth of Brauer’s lanternfish Gymnoscopelus braueri and rhombic lanternfish \emph{Krefftichthys anderssoni} (Family {M}yctophidae) in the {S}cotia {S}ea, {S}outhern {O}cean}, ' ...
'journal = {J. Fish Biol.}, ' ...
'page = {21-27}, ' ...
'volume = {111}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'fishbase'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.fishbase.org/summary/Krefftichthys-anderssoni.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

