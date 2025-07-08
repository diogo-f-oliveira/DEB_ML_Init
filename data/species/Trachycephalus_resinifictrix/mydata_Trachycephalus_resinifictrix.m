function [data, auxData, metaData, txtData, weights] = mydata_Trachycephalus_resinifictrix

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Hylidae';
metaData.species    = 'Trachycephalus_resinifictrix'; 
metaData.species_en = 'Amazon milk frog'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Tnw'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(24); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj';  'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 04];

%% set data
% zero-variate data

data.ab = 7;     units.ab = 'd';    label.ab = 'age at birth';                      bibkey.ab = 'guess';   
  temp.ab = C2K(24);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 56; units.tj = 'd';    label.tj = 'time since birth at metam';      bibkey.tj = 'Mign2015';
  temp.tj = C2K(24);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '6-10 w';
data.tp = 1.5*365; units.tp = 'd';    label.tp = 'time since metam at puberty for females';      bibkey.tp = 'guess';
  temp.tp = C2K(24);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 22*365;units.am = 'd';    label.am = 'life span';                         bibkey.am = 'AnAge';   
  temp.am = C2K(24);  units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lj  = 1.6;  units.Lj  = 'cm';  label.Lj  = 'SVL of frog at metam';              bibkey.Lj  = 'VersBrow2011'; 
data.Lp  = 5.25;  units.Lp  = 'cm';  label.Lp  = 'SVL of frog at puberty';              bibkey.Lp  = 'Mign2015';
 comment.Lp = 'value is speculative';
data.Li  = 8.8;  units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';          bibkey.Li  = 'amphibiaweb';
data.Lim  = 7.7; units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for males';           bibkey.Lim  = 'amphibiaweb';

data.Wwb = 1.8e-3; units.Wwb = 'g'; label.Wwb = 'wet weight at birth';               bibkey.Wwb = 'Mign2015';
  comment.Wwb = 'based on egg diameter of 1.5  mm: pi/6*0.15^3';
data.Wwj = 0.393; units.Wwj = 'g';   label.Wwj = 'wet weight at metam';    bibkey.Wwj = 'VersBrow2011';
data.Wwi = 71; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';    bibkey.Wwi = 'VersBrow2011';
  comment.Wwi = 'based on tL, tW and Li data: 1.17*(8.8/2.239)^3';
data.Wwim = 47.6; units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';    bibkey.Wwim = 'VersBrow2011';
  comment.Wwi = 'based on tL, tW and Lim data: 1.17*(7.7/2.239)^3';

data.Ri  = 2500/365; units.Ri  = '#/d'; label.Ri  = 'reprod rate';     bibkey.Ri  = 'amphibiaweb';   
  temp.Ri  = C2K(24);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2500 eggs per clutch, 1 clutch per yr';
  
% uni-variate data
% time-length
data.tL = [ ... % time since metam (yr), SVL (cm)
 1	1.613
14	1.664
28	1.772
42	1.920
56	2.065
70	2.141
84	2.239];
units.tL  = {'d', 'cm'};  label.tL = {'time since metam', 'SVL'};  
temp.tL    = C2K(24);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL  = 'VersBrow2011'; 

% time-weight
data.tW = [ ... % time since metam (yr), wet weight (g)
 1	0.393
14	0.419
28	0.533
42	0.722
56	0.846
70	0.921
84	1.170];
units.tW  = {'d', 'g'};  label.tW = {'time since metam', 'wet weight'};  
temp.tW    = C2K(24);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW  = 'VersBrow2011'; 

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.tW = 10 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Inhabits tree holes; tadpoles life of conspecific eggs/larvae';
metaData.bibkey.F1 = 'amphibiaweb'; 
F2 = 'IExcretes milky fuid when stressed';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '57PW6'; % Cat of Life
metaData.links.id_ITIS = '774583'; % ITIS
metaData.links.id_EoL = '1025259'; % Ency of Life
metaData.links.id_Wiki = 'Trachycephalus_resinifictrix'; % Wikipedia
metaData.links.id_ADW = 'Trachycephalus_resinifictrix'; % ADW
metaData.links.id_Taxo = '965184'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Trachycephalus+resinifictrix'; % AmphibiaWeb
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Trachycephalus_resinifictrix}}';
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
bibkey = 'VersBrow2011'; type = 'article'; bib = [ ...  
'doi = {10.1080/00222933.2012.743614}, ' ...
'author = {Elfi Verschooren and Robert K. Brown and Francis Vercammen and Jeffrey Pereboom}, ' ...
'year = {2011}, ' ...
'title  = {Ultraviolet B radiation (UV-B) and the growth and skeletal development of the {A}mazonian milk frog \emph{Trachycephalus resinifictrix}) from metamorphosis}, ' ...
'journal = {Journal of Physiology and Pathophysiology}, ' ...
'pages = {34-42}, ' ...
'volume = {2(3)}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Mign2015'; type = 'article'; bib = [ ...  
'author = {Fabien Mignet}, ' ...
'year = {2015}, ' ...
'title  = {Biology and Captive Breeding of the {A}mazonian Milk Frog, \emph{Trachycephalus resinifictrix} ({G}oeldi 1907)}, ' ...
'journal = {IRCF Reptiles \& Amphibians}, ' ...
'pages = {68–75}, ' ...
'volume = {22(2}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/cgi/amphib_query?rel-scientific_name=contains&where-scientific_name=Trachycephalus+resinifictrix}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

