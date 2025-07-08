function [data, auxData, metaData, txtData, weights] = mydata_Hyperolius_viridiflavus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Hyperoliidae';
metaData.species    = 'Hyperolius_viridiflavus'; 
metaData.species_en = 'Common reed frog'; 
metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0jFp', 'jiTi'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2017 10 31];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 31]; 

%% set data
% zero-variate data

data.ab = 10;     units.ab = 'd';    label.ab = 'age at birth';                    bibkey.ab = 'ADW';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 8*7;   units.tj = 'd';    label.tj = 'time since birth at metam';       bibkey.tj = 'ADW';   
  temp.tj = C2K(25);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.tp = 4*30.5; units.tp = 'd';    label.tp = 'time since metam at puberty';    bibkey.tp = 'ADW';
  temp.tp = C2K(25);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '3 - 12 months';
data.am = 22*365;units.am = 'd';    label.am = 'life span';                       bibkey.am = 'guess';   
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'guess based on Hyla arborea';

data.Lj  = 1.1;  units.Lj  = 'cm';  label.Lj  = 'SVL of frog at metam';           bibkey.Lj  = 'Schm1989'; 
data.Lp  = 2.0;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';                 bibkey.Lp  = 'Schm1989';
  comment.Lp = 'based on tL data for tp';
data.Li  = 3.3;  units.Li  = 'cm';  label.Li  = 'ultimate SVL';                   bibkey.Li  = 'ADW';

data.Wwb = 1.8e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';            bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwj = 0.13; units.Wwj = 'g';   label.Wwj = 'wet weight at metam';            bibkey.Wwj = 'Schm1989';
  comment.Wwj = 'based on LWw for Lj: (1.1/1.678)^3*0.4586';
data.Wwp = 0.78;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';          bibkey.Wwp = 'Schm1989';
  comment.Wwp = 'based on LWw for Lp: (2/1.678)^3*0.4586';
data.Wwi = 3.5; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';             bibkey.Wwi = 'Schm1989';
  comment.Wwi = 'based on LWw for Li: (3.3/1.678)^3*0.4586';

data.Ri  = 3*330/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 4.5 cm SVL'; bibkey.Ri  = 'ADW';   
  temp.Ri  = C2K(25);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'max 330 eggs per clutch, but multiple clutches per season';
 
% uni-variate data
% time-length
data.tL = [ ... % time since metam (month), SVL (cm)
14.658	1.304
16.873	1.295
18.701	1.331
29.893	1.542
31.698	1.560
32.632	1.593
58.839	1.713
59.976	1.731
62.477	1.769
88.414	1.853
89.833	1.916
91.857	1.931
120.187	1.973
122.421	1.979
124.501	2.036]; 
units.tL   = {'d', 'cm'};  label.tL = {'time since metam', 'SVL'};  
temp.tL    = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'Schm1989';
comment.tL = 'Data for H. v. taeniatus';

% length-wet weight
data.LWw = [ ... % SVL (cm), dry weight (g)
1.74 0.4955
1.60 0.3857
1.63 0.4384
1.61 0.4273
1.74 0.5167
1.67 0.4591
1.75 0.5162
1.62 0.3529
1.73 0.5119
1.69 0.4827]; % mean 1.678 0.4586
units.LWw   = {'cm', 'g'};  label.LWw = {'SVL', 'wet weight'};  
bibkey.LWw  = 'Schm1989';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 50 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Females can change to males, which can fertilize other females';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3NR2M'; % Cat of Life
metaData.links.id_ITIS = '663190'; % ITIS
metaData.links.id_EoL = '130067'; % Ency of Life
metaData.links.id_Wiki = 'Hyperolius_viridiflavus'; % Wikipedia
metaData.links.id_ADW = 'Hyperolius_viridiflavus'; % ADW
metaData.links.id_Taxo = '138972'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Hyperolius+viridiflavus'; % AmphibiaWeb


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyperolius_viridiflavus}}';
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
bibkey = 'Schm1989'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Schmuck, R.}, ' ...
'year = {1989}, ' ...
'title  = {\"{O}kophysiologie Afrikanischer Riedfr\"{o}sche. Besiedlung extremer Lebensr\"{a}ume.}, ' ...
'publisher = {Verlag Josef Margraf}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-scientific_name=contains&where-scientific_name=Hyperolius_viridiflavus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Hyperolius_viridiflavus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

