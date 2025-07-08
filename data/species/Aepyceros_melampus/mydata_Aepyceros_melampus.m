function [data, auxData, metaData, txtData, weights] = mydata_Aepyceros_melampus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Aepyceros_melampus'; 
metaData.species_en = 'Impala'; 

metaData.ecoCode.climate = {'Aw', 'BWh', 'BSh', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTi', '0iTs', '0iTa', '0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Wwe'; 't-Ww'}; 

metaData.COMPLETE = 2.7; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 07 09];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2014 07 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2016 11 14];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University Amsterdam'};   

metaData.date_mod_3     = [2023 04 13];              
metaData.email_mod_3    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_3  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 13];

%% set data
% zero-variate data

data.tg = 6.5*30.5;  units.tg = 'd';   label.tg = 'gestation time';             bibkey.tg = 'MeyeFick2008';   
  temp.tg = C2K(39.5); units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'temp from MeyeFick2008';
data.tx = 5*30.5;    units.tx = 'd';   label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(39.5); units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 2*365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'theanimalfiles';
  temp.tp = C2K(39.5); units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '1 till 2 yr';
data.am = 15*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(39.5); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 5370;    units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
data.Wwi = 38300;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'Fair1983';
data.Wwim = 49200;  units.Wwim = 'g';  label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'Fair1983';

data.Ri  = 2/362;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(39.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'max 2 cycles per year; one calf at a time (Wiki), very rarely two calves (wildlife)';
  
% uni-variate data
% time-weight
data.tW_m = [ ... % time (yr), weight (kg)
0.486	24.914
0.749	22.305
0.989	32.575
1.500	36.501
2.005	36.307
3.010	40.813
5.005	48.925
9.996	47.123];
data.tW_m(:,1) = 365 * data.tW_m(:,1); % convert yr to d
data.tW_m(:,2) = 1e3 * data.tW_m(:,2); % convert kg to g
units.tW_m  = {'d', 'g'}; label.tW_m = {'time since birth', 'wet weight'};  
temp.tW_m   = C2K(39.5); units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Fair1983';
comment.tW_m = 'Data for male'; 
% time-weight for foetal development
data.aW_e = [196 5.37; % age (d), wet weight (g)
	 189 4.16;
	 182 3.105;
	 175 2.739;
	 168 2.335;
	 161 1.881;
	 154 2.150;
	 147 1.430;
	 140 1.245;
	 133 0.85201;
	 126 0.85501;
	 119 0.34000;
	 112 0.39501;
	 105 0.32080;
	 98  0.15060;
	 91  0.11100;
	 84  0.10581;
	 77  0.05651;
	 70  0.04541;
	 63  0.02900;
	 56  0.010608;
	 49  0.012208;
	 42  0.002904;
	 35  0.001895;
	 28  0.001];
data.aW_e(:,2) = 1e3 * data.aW_e(:,2); % convert kg to g
units.aW_e  = {'d', 'g'}; label.aW_e = {'age', 'wet weight'};  
temp.aW_e   = C2K(39.5); units.temp.aW_e = 'K'; label.temp.aW_e = 'temperature';
bibkey.aW_e = 'Fair1983';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Slow foetal development is assumed';     
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = ['A pregnant female is capable of extending her gestation period by up to 2 weeks if the start of the summer rains are late' ...
    'which will result in poor grazing value and thus poor nutritional value of her milk produced'];
metaData.bibkey.F1 = 'wildlife'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '64ZMM'; % Cat of Life
metaData.links.id_ITIS = '625076'; % ITIS
metaData.links.id_EoL = '308540'; % Ency of Life
metaData.links.id_Wiki = 'Aepyceros_melampus'; % Wikipedia
metaData.links.id_ADW = 'Aepyceros_melampus'; % ADW
metaData.links.id_Taxo = '68440'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200488'; % MSW3
metaData.links.id_AnAge = 'Aepyceros_melampus'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Aepyceros_melampus}}';
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
bibkey = 'Fair1962'; type = 'Article'; bib = [ ... 
'author = {Fairall, N.}, ' ... 
'year = {1962}, ' ...
'title = {Prenatal development of the impala, \emph{Aepyceros melampus}}, ' ...
'journal = {Koedoe}, ' ...
'volume = {12}, ' ...
'pages = {97--103}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Fair1983'; type = 'Article'; bib = [ ... 
'author = {Fairall, N.}, ' ... 
'year = {1983}, ' ...
'title = {Production parameters of the impala, \emph{Aepyceros melampus}}, ' ...
'journal = {S. Afr. J. Anim. Sci.}, ' ...
'volume = {13}, ' ...
'pages = {176--179}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MeyeFick2008'; type = 'Article'; bib = [ ... 
'author = {Meyer, L.C. and Fick, L. and Matthee, A. and Mitchell, D. and Fuller, A.}, ' ... 
'year = {2008}, ' ...
'title = {Hyperthermia in captured impala (\emph{Aepyceros melampus}): A fright not flight response}, ' ...
'journal = {J. Wildlife Diseases}, ' ...
'volume = {44}, ' ...
'pages = {404--416}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Aepyceros_melampus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'wildlife'; type = 'Misc'; bib = ...
'howpublished = {\url{http://southafrican-wildlife.blogspot.nl/2009/05/impala-facts.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'theanimalfiles'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.theanimalfiles.com/mammals/hoofed_mammals/impala.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

