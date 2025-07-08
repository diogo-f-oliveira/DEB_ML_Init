function [data, auxData, metaData, txtData, weights] = mydata_Bufo_bufo

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Bufo_bufo'; 
metaData.species_en = 'Common toad'; 

metaData.ecoCode.climate = {'Cfb', 'Dfb', 'Dfc'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fh'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjO', 'jiCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Jan Baas';'Bas Kooijman'};    
metaData.date_subm = [2014 05 31];              
metaData.email    = {'janbaa@ceh.ac.uk'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1 = [2017 10 24];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2 = [2019 05 15];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 05 15]; 


%% set data
% zero-variate data

data.ab = 8;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'amphibiaweb';   
  temp.ab = C2K(10);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'based on Anaxyrus americanus';
data.tj = 58;    units.tj = 'd';    label.tj = 'time since birth at metam';bibkey.tj = 'KatzWari2003';   
  temp.tj = C2K(15);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
data.tp = 2.5*365;  units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'EoL';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 13000; units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1.3;  units.Lj  = 'cm';  label.Lj  = 'total length at metam';   bibkey.Lj  = 'KatzWari2003'; 
data.Lp  = 13;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'KatzWari2003'; 
data.Li  = 15;   units.Li  = 'cm';  label.Li  = 'ultimate total length for females';   bibkey.Li  = 'KatzWari2003';
data.Lim  = 10;   units.Lim  = 'cm';  label.Lim  = 'ultimate total length for males';   bibkey.Lim  = 'guess';

data.Wwb = 0.0042; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'amphibiaweb';
  comment.Wwb = 'based on Anaxyrus americanus';
data.Wwj = 0.35; units.Wwj = 'g';   label.Wwj = 'wet weight at metam';     bibkey.Wwj = 'KatzWari2003';
data.Wwi = 417;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = {'KatzWari2003','ReadClar1995'};
  comment.Wwi = 'based on Wwi = exp(-10.1 + 3.22 * 1og(10*Li)), see F4';
data.Wwim = 83;   units.Wwim = 'g';   label.Wwim = 'ultimate wet weight of males'; bibkey.Wwim = 'ReadClar1995';
  comment.Wwim = 'based on Wwim = exp(-8.01 + 2.70 * 1og(10*Lim))';
  
data.Ri  = 1500/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'EoL';   
temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
comment.Ri = '1 brood/year';
 
% uni-variate data
% time-length
data.tL = [ ... % time since hatch (day 1 = hatching day), body length (mm)
16.795	3.036
16.796	3.993
23.102	4.949
23.931	6.065
23.932	6.862
30.897	8.855
30.898	9.891
30.899	11.087
37.694	11.884
38.033	9.891
38.034	10.848
44.319	10.928
44.320	11.725
44.321	12.841
50.945	9.971
50.946	11.007
50.947	11.964
50.948	13.000
58.082	11.007
58.083	12.043
58.084	13.000];
data.tL(:,1) = data.tL(:,1) - 1; % set hatch at zero
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
units.tL   = {'d', 'cm'};  label.tL = {'time since hatch', 'body length'};  
temp.tL    = [0 10 20 30 40 50; 5 10 15 26 26 10]';  units.temp.tL = {'t','C'}; label.temp.tL = {'time','temperature'};
bibkey.tL = 'KatzWari2003';
comment.tL = 'temperatures ranged from 5 to 26 C; profile is guessed';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 3 * weights.psd.v;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'We here assume that, at metam, del_M and z change';
D2 = 'mod 2: ingestion-growth data removed, given in Jorg1988  because the time unit was not indicated and toad weight unclear';
D3 = 'mod 2: ultimate body weight is substantially increased, and sex dimorphy made explicit and Wwb reduced';
D4 = 'Males are assumed to differ from females by {p_Am} only';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3, 'D4',D4);

%% Facts
F1 = ['Spends its life as a tadpole in the water and as an adult mainly on land in water rich environments. '...
      'Female toads are somewhat larger (~15 cm) than males (~13 cm). '...
      'It has a larval period of ca 58 days and it can become relatively old with a max age of ca 36 years. '... 
      'At an age of 3 - 4 years it starts reproduction. It lays a max of 8,000 eggs once a year. '...
      'During winter it hibernates and in spring massive amounts of toads can migrate to their breeding grounds. '... 
      'It has a characteristic way of laying eggs in strings.'];
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Tadpoles lose much of their weight during metamorphosis';
metaData.bibkey.F2 = 'Wiki'; 
F3 = 'length-weight males = Ww in g  = exp(-8.01 + 2.70 * 1og(SVL im mm))';
metaData.bibkey.F3 = 'ReadClar1995'; 
F4 = 'length-weight females = Ww in g  = exp(-10.1 + 3.22 * 1og(SVL im mm))';
metaData.bibkey.F4 = 'ReadClar1995'; 
metaData.facts = struct('F1',F1,'F2',F2,'F3',F3,'F4',F4);

%% Links
metaData.links.id_CoL = 'NP2D'; % Cat of Life
metaData.links.id_ITIS = '173480'; % ITIS
metaData.links.id_EoL = '333310'; % Ency of Life
metaData.links.id_Wiki = 'Bufo_bufo'; % Wikipedia
metaData.links.id_ADW = 'Bufo_bufo'; % ADW
metaData.links.id_Taxo = '47784'; % Taxonomicon
metaData.links.id_WoRMS = '1350162'; % WoRMS
metaData.links.id_amphweb = 'Bufo+bufo'; % AmphibiaWeb
metaData.links.id_AnAge = 'Bufo_bufo'; % AnAge


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
bibkey = 'KatzWari2003'; type = 'Article'; bib = [ ... 
'author = {Katzmann, S. and Waringer-Loschenkohl, A. and Waringer, A.}, ' ... 
'year = {2003}, ' ...
'title = {Effects of inter- and intraspecific competition on growth and development of \emph{Bufo viridis} and \emph{Bufo bufo} tadpoles}, ' ...
'journal = {Limnologica}, ' ...
'volume = {33}, ' ...
'pages = {122--130}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Jorg1988'; type = 'Article'; bib = [ ... 
'author = {Jorgensen, C. J.}, ' ... 
'year = {1988}, ' ...
'title = {Metabolic costs of growth and maintenance in the toad, \emph{Bufo bufo}}, ' ...
'journal = {J. exp Biol.}, ' ...
'volume = {138}, ' ...
'pages = {319--331}'];
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
%
bibkey = 'ReadClar1995'; type = 'Article'; bib = [ ... 
'author = {C. J. Reading. R. T. Clarke}, ' ... 
'year = {1995}, ' ...
'title = {The effects of density, rainfall and environmental temperature on body condition and fecundity in the common toad, \emph{Bufo bufo}}, ' ...
'journal = {Oecologia}, ' ...
'volume = {102}, ' ...
'pages = {453-459}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/333310/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://amphibiaweb.org/species/100}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

