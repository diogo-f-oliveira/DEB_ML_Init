function [data, auxData, metaData, txtData, weights] = mydata_Peltophryne_lemur

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Peltophryne_lemur'; 
metaData.species_en = 'Puerto Rican crested toad'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.7); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'t-W'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 07 25];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 08];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 08];

%% set data
% zero-variate data

data.ab = 1;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Mill1985';   
  temp.ab = C2K(27.7);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tj = 25;    units.tj = 'd';    label.tj = 'time since birth at metam';bibkey.tj = 'Mill1985';   
  temp.tj = C2K(27.7);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = '20 till 30 d';
data.tp = 365;  units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'Mill1985';
  temp.tp = C2K(27.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 10.7*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(27.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 0.5;  units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'Mill1985';  
data.Ljb  = 3.5;  units.Ljb  = 'cm'; label.Ljb  = 'total length at metam tadpode';   bibkey.Ljb  = 'Mill1985'; 
data.Lj  = 1.0;  units.Lj  = 'cm';  label.Lj  = 'total length at metam frog';   bibkey.Lj  = 'Mill1985'; 
data.Lp  = 13;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Mill1985'; 
data.Li  = 12;   units.Li  = 'cm';  label.Li  = 'ultimate SVL of female';  bibkey.Li  = 'EoL';
data.Lim = 8.5;  units.Lim  = 'cm'; label.Lim  = 'ultimate SVL for male';   bibkey.Lim  = 'EoL';

data.Wwb = 0.05; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BrunBern2009';
  comment.Wwb = 'corrected data for Bufo bufo';

data.Ri  = 1500/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(27.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 brood/year; ADW gives 15000 per yr, but in view of Bufo data, this is a factor 10 off';
 
% uni-variate data
% time-weight
data.tW_f = [ ... % time (d), weight (g)
63.412	3.696
95.074	7.762
126.156	12.567
156.083	18.480
185.426	25.318
216.875	40.657
250.210	46.201
280.106	53.778
309.312	67.823
342.720	69.487];
data.tW_f(:,1) = data.tW_f(:,1) - data.tW_f(1,1); % set origin
units.tW_f   = {'d', 'g'};  label.tW_f = {'time', 'weight', 'female'};  
temp.tW_f    = C2K(27.7);  units.temp.tW_f = 'K'; label.temp.tW_f = 'temperature';
bibkey.tW_f = 'Mill1985';
comment.tW_f = 'Data for female';
%
data.tW_m = [ ... % time (d), weight (g)
63.412	3.696
92.226	8.501
120.478	13.121
151.489	21.622
186.493	28.830
243.597	36.222
280.997	36.591
312.159	37.146
343.268	40.472];
data.tW_m(:,1) = data.tW_m(:,1) - data.tW_f(1,1); % set origin
units.tW_m   = {'d', 'g'};  label.tW_m = {'time', 'weight', 'male'};  
temp.tW_m    = C2K(27.7);  units.temp.tW_m = 'K'; label.temp.tW_m = 'temperature';
bibkey.tW_m = 'Mill1985';
comment.tW_m = 'Data for male';
  
%% set weights for all real data
weights = setweights(data, []);
weights.ab = 0 * weights.ab;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tW_f','tW_m'}; subtitle1 = {'data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'At metam, del_M and {p_Am} are assumed to change';
D2 = 'Males are assumed to differ from females by {p_Am}';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);

%% Links
metaData.links.id_CoL = '76FWJ'; % Cat of Life
metaData.links.id_ITIS = '173496'; % ITIS
metaData.links.id_EoL = '331265'; % Ency of Life
metaData.links.id_Wiki = 'Peltophryne_lemur'; % Wikipedia
metaData.links.id_ADW = 'Peltophryne_lemur'; % ADW
metaData.links.id_Taxo = '137440'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Peltophryne+lemur'; % AmphibiaWeb
metaData.links.id_AnAge = 'Peltophryne_lemur'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Bufo_bufo}}';
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
bibkey = 'Mill1985'; type = 'Article'; bib = [ ... 
'author = {T. J. Miller}, ' ... 
'year = {1985}, ' ...
'title = {Husbandry and Breeding of the {P}uerto {R}ican Toad (\emph{Peltophryne lemur}) With Comments on Its Natural History}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {4}, ' ...
'pages = {281--286}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/333310/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Peltophryne_lemur}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Peltophryne_lemur/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BrunBern2009'; type = 'Article'; bib = [ ... 
'author = {E. Brunelli and I. Bernab\`{o} and C. Bergb and K. Lundstedt-Enkel and A. Bonaccia and S. Tripepia}, ' ... 
'year = {2009}, ' ...
'title = {Environmentally relevant concentrations of endosulfan impair development, metamorphosis and behaviour in \emph{Bufo bufo} tadpoles}, ' ...
'journal = {Aquatic Toxicology}, ' ...
'volume = {91}, ' ...
'pages = {135--142}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
