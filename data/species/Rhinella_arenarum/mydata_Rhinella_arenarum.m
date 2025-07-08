function [data, auxData, metaData, txtData, weights] = mydata_Rhinella_arenarum

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Anura'; 
metaData.family     = 'Bufonidae';
metaData.species    = 'Rhinella_arenarum'; 
metaData.species_en = 'Argentine toad'; 

metaData.ecoCode.climate = {'Am', 'Cfa', 'Cfb'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0jFp', 'jiTf', 'jiTg'};
metaData.ecoCode.embryo  = {'Fc'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23); % K, body temp (mean temperature)
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Ww0'; 'Wwj'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'};    
metaData.date_subm = [2018 12 06];              
metaData.email    = {'sta@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, Tromso, Norway'};   

metaData.curator     = {'Bas Kooijman'};
metaData.email_cur   = {'bas.kooijman@vu.nl'}; 
metaData.date_acc    = [2018 12 07]; 


%% set data
% zero-variate data

data.ab = 216/24;    units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'CandNata2010';   
  temp.ab = C2K(25);  units.temp.ab = 'K'; label.temp.ab = 'temperature';

data.tj = 60;    units.tj = 'd';    label.tj = 'time since birth at metam';bibkey.tj = 'BrodSass2013';   
  temp.tj = C2K(20);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'first individuals to complete metamorphose fig 3a; authors begin exposure at birth, time is time since start of exposure;';

data.tp = 365;  units.tp = 'd';    label.tp = 'time since brith at puberty'; bibkey.tp = 'BionBabi2018';
  temp.tp = C2K(23);  units.temp.tp = 'K'; label.temp.tp = 'temperature';

data.am = 5 * 365; units.am = 'd';    label.am = 'life span';  bibkey.am = 'BionBabi2018';   
  temp.am = C2K(23);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'max longevity recorded in table 2'; 

data.Lj  = 2.4;  units.Lj  = 'cm';  label.Lj  = 'total length at metam';   bibkey.Lj  = 'BabiBion2015'; 
  comment.Lj = 'fig 1, lab';
data.Lp  = 11.2;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty'; bibkey.Lp  = 'BionBabi2018'; 
  comment.Lp = 'table2, largest Lp for females reported';
data.Li  = 13.1;   units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'BionBabi2018';
  comment.Li = 'maximum estimated asymtotic length, table 3';

data.Ww0 = 612/34535; units.Ww0 = 'g';   label.Ww0 = 'wet weight of egg';     bibkey.Ww0 = 'BabiBion2018';
  comment.Ww0 = 'oviposition mass divided by number of eggs site C2, table 2. There is some biasis due to the gelatinous stuff that holds the string together.';
data.Wwj = 0.2; units.Wwj = 'g';   label.Wwj = 'wet weight at metam';     bibkey.Wwj = 'BrodSass2013';
data.Wwi = 250; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'BrodSass2013';
  comment.Wwi = 'max weight of adults sampled in this study.';

data.Ri  = 34535/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'BabiBion2018';  
  temp.Ri = C2K(22.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'assuming 1 clutch/year, table 2, site C2 (maximum across all sites), the temp is the mean recorded at that site.';
 
% uni-variate data
data.tL = [ ... % time since hatch (year expressed as LAG number, lines of arrested growth), SVL length (mm)
0.03	12.76
0.03	14.58
0.03	15.99
1.02	83.21
2.02	101.25
2.02	104.90
1.99	109.95
3.00	101.08
3.03	108.57
4.02	113.87];
data.tL(:,1) = data.tL(:,1)* 365; % convert yr to d  
data.tL(:,2) = data.tL(:,2)/10; % convert mm to cm
comment.tL = 'females 2008, fig 4B';
units.tL   = {'d', 'cm'};  label.tL = {'time since hatch', 'SVL length'};  
temp.tL    = C2K(23);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BionKost2015';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;
weights.tL = 50 * weights.tL;
weights.tj = 0 * weights.tj;
weights.Lp = 0 * weights.Lp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;
weights.psd.p_M = 10 * weights.psd.p_M;
weights.psd.kap = 15 * weights.psd.kap;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'It is likely that parameter change at some point during the life cycle.  This entry could be improved by implementing such an assumption. I prefer to leave as is for now until more data becomes available.';
D2 = 'tj is ignorned, since (tj,Wwj) is inconsistent with tL';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Tadpoles begin feeding at stage 25';
metaData.bibkey.F1 = 'BrodSass2013'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4S7MB'; % Cat of Life
metaData.links.id_ITIS = '773692'; % ITIS
metaData.links.id_EoL = '1019163'; % Ency of Life
metaData.links.id_Wiki = 'Rhinella_arenarum'; % Wikipedia
metaData.links.id_ADW = 'Rhinella_arenarum'; % ADW
metaData.links.id_Taxo = '1395841'; % Taxonomicon
metaData.links.id_WoRMS = '1432726'; % WoRMS
metaData.links.id_amphweb = 'Rhinella+arenarum'; % AmphibiaWeb
metaData.links.id_AnAge = 'Rhinella_arenarum'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhinella_arenarum}}';
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
bibkey = 'BionBabi2018'; type = 'Article'; bib = [ ... 
'author = {Clarissa de L. Bionda and Selene Babiniand Adolfo L. Martino and Nancy E. Salas and Rafael C. Lajmanovich}, ' ... 
'year = {2018}, ' ...
'title = {Impact assessment of agriculture and livestock over age, longevity and growth of populations of common toad \emph{Rhinella arenarum} (anura: {B}ufonidae), central area of {A}rgentina}, ' ...
'journal = {Global Ecology and Conservation}, ' ...
'volume = {14}, ' ...
'doi = {10.1016/j.gecco.2018.e00398} ,' ... 
'pages = {e00398}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BabiBion2015'; type = 'Article'; bib = [ ... 
'author = {Maria Selene Babini  and Clarisa de Lourdes Bionda and Nancy Edith Salas and Adolfo Ludovico Martino}, ' ... 
'year = {2015}, ' ...
'title = {Health status of tadpoles and metamorphs of \emph{Rhinella arenarum} ({A}nura,Bufonidae) that inhabit agroecosystems and its implications for land use}, ' ...
'journal = {Ecotoxicology and Environmental Safety}, ' ...
'volume = {118}, ' ...
'doi = {10.1016/j.ecoenv.2015.04.017} ,' ... 
'pages = {118--124}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BabiBion2018'; type = 'Article'; bib = [ ... 
'author = {Maria Selene Babinia and Clarisa de Lourdes Bionda and Zulma Anahi Salinasa and Nancy Edith Salas and Adolfo Ludovico Martino}, ' ... 
'year = {2018}, ' ...
'title = {Reproductive endpoints of \emph{Rhinella arenarum} ({A}nura, {B}ufonidae): Populations that persist in agroecosystems and their use for the environmental health assessment}, ' ...
'journal = {Ecotoxicology and Environmental Safety}, ' ...
'volume = {154}, ' ...
'doi = {10.1016/j.ecoenv.2018.02.050} ,' ... 
'pages = {294--301}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BionKost2015'; type = 'Article'; bib = [ ... 
'author = {Clarisa de L. Bionda and Silvia Kost and Nancy E. Salas and Rafael C. Lajmanovich and Ulrich Sinsch and Adolfo L. Martino1}, ' ... 
'year = {2015}, ' ...
'title = {Age structure, growth and longevity in the common toad, \emph{Rhinella arenarum}, from {A}rgentina}, ' ...
'journal = {Acta Herpetologica}, ' ...
'volume = {10}, ' ...
'number = {1}, ' ...
'doi = {10.13128/Acta_Herpetol-15142} ,' ... 
'pages = {55--62}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BrodSass2013'; type = 'Article'; bib = [ ... 
'author = {Julie C. Brodeur and Alina Sassone and Gladys N. Hermida and Nadia Codugnello}, ' ... 
'year = {2013}, ' ...
'title = {Environmentally-relevant concentrations of atrazine induce non-monotonic acceleration of developmental rate and increased size at metamorphosis in \emph{Rhinella arenarum} tadpoles}, ' ...
'journal = {Ecotoxicology and Environmental Safety}, ' ...
'volume = {92}, ' ...
'doi = {10.1016/j.ecoenv.2013.01.019} ,' ... 
'pages = {10--17}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CandNata2010'; type = 'Article'; bib = [ ... 
'author = {Josefina Vera Candioti and Guillermo S. Natale and Sonia Soloneski and Alicia E. Ronco and Marcelo L. Larramendy}, ' ... 
'year = {2010}, ' ...
'title = {Sublethal and lethal effects on \emph{Rhinella Arenarum} ({A}nura, {B}ufonidae) tadpoles exerted by the pirimicarb-containing technical formulation insecticide Aficida(R)}, ' ...
'journal = {Chemosphere}, ' ...
'volume = {78}, ' ...
'number = {3}, ' ...
'doi = {10.1016/j.chemosphere.2009.10.064} ,' ... 
'pages = {249--255}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

