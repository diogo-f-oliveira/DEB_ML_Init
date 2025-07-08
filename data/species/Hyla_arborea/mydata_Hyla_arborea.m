function [data, auxData, metaData, txtData, weights] = mydata_Hyla_arborea

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Hylidae';
metaData.species    = 'Hyla_arborea'; 
metaData.species_en = 'European tree frog'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Csb', 'BSk'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Fpf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

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

data.ab = 9;     units.ab = 'd';    label.ab = 'age at birth';                      bibkey.ab = 'Gros1994';   
  temp.ab = C2K(23);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 51;   units.tj = 'd';    label.tj = 'time since birth at metam';          bibkey.tj = 'Gros1994';   
  temp.tj = C2K(24.5);  units.temp.tj = 'K'; label.temp.tj = 'temperature'; 
data.tp = 4*30.5; units.tp = 'd';    label.tp = 'time since metam at puberty';      bibkey.tp = 'Gros1994';
  temp.tp = C2K(14);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 22*365;units.am = 'd';    label.am = 'life span';                         bibkey.am = 'AnAge';   
  temp.am = C2K(14);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb  = 1.1;  units.Lb  = 'cm';  label.Lb  = 'total length of tadpole at birth';  bibkey.Lb  = 'Gros1994'; 
data.Ljb  = 4.6; units.Ljb  = 'cm'; label.Ljb  = 'total length of tadpole at metam'; bibkey.Ljb  = 'Gros1994'; 
data.Lj  = 1.6;  units.Lj  = 'cm';  label.Lj  = 'SVL of frog at metam';              bibkey.Lj  = 'Gros1994'; 
data.Lp  = 2.3;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty';                    bibkey.Lp  = 'Gros1994';
data.Li  = 5.0;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';          bibkey.Li  = 'Wiki';
data.Lim  = 4.3; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';           bibkey.Lim  = 'Wiki';

data.Wwb = 1.8e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'Wiki';
  comment.Wwb = 'based on egg diameter of 1.5 mm: pi/6*0.15^3';
data.Wwj = 0.60; units.Wwj = 'g';   label.Wwj = 'wet weight at metam';               bibkey.Wwj = 'Gros1994';
data.Wwp = 1.7;  units.Wwp = 'g';  label.Wwp = 'wet weight at puberty';              bibkey.Wwp = 'Gros1994';
  comment.Wwp = 'based on (Lp/Lj)^3 * Wwj';
data.Wwi = 4.8; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'Gros1994';
  comment.Wwi = 'based on tW';
data.Wwim = 3.1; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'Gros1994';
  comment.Wwim = 'based on tW and tL data for Lim: (4.3/5)^3 *4.8';

data.Ri  = 2000/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate at 4.5 cm SVL';     bibkey.Ri  = 'amphibiaweb';   
  temp.Ri  = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data
% time-length
data.tLb = [ ... % age (d), total length (cm)
0.000	0.667
6.868	0.967
14.234	1.499
21.458	1.928
28.977	2.710
36.347	3.287
43.601	4.087
51.105	4.684]; % metam 
units.tLb   = {'d', 'cm'};  label.tLb = {'age', 'total length'};  
temp.tLb    = C2K(23);  units.temp.tLb = 'K'; label.temp.tLb = 'temperature';
bibkey.tLb  = 'Gros1994';
comment.tL = 'Data for tadpoles';
%
data.tL = [ ... % time since metam (month), SVL (cm)
 0.01	1.598
 3	2.037
 9	3.323
15	4.496]; 
data.tL(:,1) = 30.5 * data.tL(:,1); % convert month to d
units.tL   = {'d', 'cm'};  label.tL = {'time since metam', 'SVL'};  
temp.tL    = C2K(24.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'Gros1994';

% time-weight
data.tW = [ ... % time since metam (month), wet weight (g)
 0	0.634
 3	0.910
 9	3.476
15	4.465];
data.tW(:,1) = 30.5 * data.tW(:,1); % convert month to d
units.tW   = {'d', 'g'};  label.tW = {'time since metam', 'wet weight'};  
temp.tW    = C2K(24.5);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'Gros1994';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 5 * weights.Li;
weights.Lim = 5 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'tadpoles are assumed to differ from frogs by del_M only';
D2 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '3NCKV'; % Cat of Life
metaData.links.id_ITIS = '662424'; % ITIS
metaData.links.id_EoL = '332925'; % Ency of Life
metaData.links.id_Wiki = 'Hyla_arborea'; % Wikipedia
metaData.links.id_ADW = 'Hyla_arborea'; % ADW
metaData.links.id_Taxo = '47847'; % Taxonomicon
metaData.links.id_WoRMS = '1506631'; % WoRMS
metaData.links.id_amphweb = 'Hyla+arborea'; % AmphibiaWeb
metaData.links.id_AnAge = 'Hyla_arborea'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Hyla_arborea}}';
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
bibkey = 'Gros1994'; type = 'Book'; bib = [ ...  
'author = {Grosse, W.-R.}, ' ...
'year = {1994}, ' ...
'title  = {Der Laubfrosch \emph{Hyla arborea}}, ' ...
'publisher = {Westarp Wissenschaften}, ' ...
'series = {Die Neue Brehm-Buecherei}, ' ...
'volume = {615}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-scientific_name=contains&where-scientific_name=Hyla+arborea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Hyla_arborea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

