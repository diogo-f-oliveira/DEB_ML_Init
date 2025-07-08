function [data, auxData, metaData, txtData, weights] = mydata_Heterocephalus_glaber

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Bathyergidae';
metaData.species    = 'Heterocephalus_glaber'; 
metaData.species_en = 'Naked mole rat'; 

metaData.ecoCode.climate = {'BWh', 'BSh'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTa', '0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHr'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(32.1); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 09 03];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Starrlight Augustine'};    
metaData.date_mod_1 = [2016 11 14];              
metaData.email_mod_1    = {'starrlight.augustine@akvaplan.niva.no'};            
metaData.address_mod_1  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2016 11 14]; 

%% set data
% zero-variate data

data.tg = 70;    units.tg = 'd';     label.tg = 'gestation time';             bibkey.tg = 'Wiki';   
  temp.tg = C2K(32.1);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 30;    units.tx = 'd';     label.tx = 'time since birth at weaning'; bibkey.tx = 'Wiki';   
  temp.tx = C2K(32.1);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'after which worker give faeces till solid food is taken';
data.tp = 365;   units.tp = 'd';     label.tp = 'time since birth at puberty'; bibkey.tp = 'zooatlanta';
  temp.tp = C2K(32.1); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 28*365;    units.am = 'd'; label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(32.1); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'longest lifespan among rodents';

data.Li  = 9;   units.Li  = 'cm';    label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';
  comment.Li = '8-10 cm';

data.Wwb = 2;   units.Wwb = 'g';     label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'Wiki';
data.Wwi = 32.5;   units.Wwi = 'g';  label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = '30-35g';

data.Ri  = 11/ 365;  units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(32.1); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'litters 3-12, sometimes 28';
 
% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), wet weight (g)
0.019	1.925
0.510	3.492
0.596	3.971
1.010	6.007
1.307	8.096
1.510	10.238
1.519	11.304
1.684	11.136
1.797	13.036
1.960	13.105
1.973	13.816
2.085	14.118
11.988	30.621
13.182	31.816
13.360	30.762
17.408	26.149];
data.tW(:,1) = 30.5 * data.tW(:,1); % convert month to d
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(32.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'SherJarv1991';
  
%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = [ 'metabolic rate 2/3 of a mouse of the same size during starvation, metabolic rate can be reduced to 0.25; ' ...
       'body temp = ambient temp; ' ...
       'switches from a typical poikilothermic pattern to a homeothermic mode at 28 C. '...    
       'only 1 female and 1-3 males reproduce in a colony; '...
       'queen creates space between vertebrae for space of litters; '...
       'colonies 20-300 individuals, average 75; '...
       'eats tubers such that they can regenerate; can digest celloluse with microflora'];
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '3L83H'; % Cat of Life
metaData.links.id_ITIS = '584677'; % ITIS
metaData.links.id_EoL = '326232'; % Ency of Life
metaData.links.id_Wiki = 'Heterocephalus_glaber'; % Wikipedia
metaData.links.id_ADW = 'Heterocephalus_glaber'; % ADW
metaData.links.id_Taxo = '63627'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13400041'; % MSW3
metaData.links.id_AnAge = 'Heterocephalus_glaber'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Heterocephalus_glaber}}';
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
bibkey = 'SherJarv1991'; type = 'Book'; bib = [ ... 
'author = {Sherman, P. W. and Jarvis, J. U. M. and Alexander, R. D.}, ' ... 
'year = {1991}, ' ...
'title = {The biology of the naked mole-rate}, ' ...
'publisher = {Princetin Univ Press}, ' ...
'howpublished = {\url{http://www.zooatlanta.org/home/animals/mammals/naked_mole_rat}}, ' ... 
'address = {Princetin}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Heterocephalus_glaber}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'zooatlanta'; type = 'Misc'; bib = ...
'howpublished = {\url{https://zooatlanta.org/animal/naked-mole-rat/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

