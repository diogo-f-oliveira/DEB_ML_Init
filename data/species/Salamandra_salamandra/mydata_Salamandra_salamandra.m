function [data, auxData, metaData, txtData, weights] = mydata_Salamandra_salamandra

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Caudata'; 
metaData.family     = 'Salamandridae';
metaData.species    = 'Salamandra_salamandra'; 
metaData.species_en = 'Fire salamander'; 

metaData.ecoCode.climate = {'Csb', 'Cfb', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0jFc', 'jiTf'};
metaData.ecoCode.embryo  = {'Fs'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww_f'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 17];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 17]; 


%% set data
% zero-variate data

data.tj = 219;  units.tj = 'd';    label.tj = 'time since birth at metam'; bibkey.tj = 'WarbDega1979';
  temp.tj = C2K(15);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'caudata: 28 d at 5 cm';
data.tp = 2*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'caudata';
  temp.tp = C2K(15);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = '2 till 4 yr';
data.am = 50*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'Wiki';   
  temp.am = C2K(15);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 3.6;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'WarbDega1979';
data.Lj  = 6.8;   units.Lj  = 'cm';  label.Lj  = 'total length at metam'; bibkey.Lj  = 'WarbDega1979'; 
data.Lp  = 12.5;  units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for males'; bibkey.Lp  = 'caudata'; 
data.Li  = 25;    units.Li  = 'cm';  label.Li  = 'ultimate SVL';   bibkey.Li  = 'Wiki';

data.Wwb = 0.25; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'WarbDega1979';
data.Wwj = 2.5; units.Wwj = 'g';   label.Wwj = 'wet weight at metam';     bibkey.Wwj = 'WarbDega1979';
data.Wwp = 5;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = 'caudata';
  comment.Wwp = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 40;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'WarbDega1979';

data.Ri = 22.6/365;  units.Ri = '#/d';   label.Ri = 'reprod rate at 25.3 g';  bibkey.Ri = 'KoppBaur2000';
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 

% univariate data
% time-weight
data.tW1 = [... % time since birth (d), wet weight (g)
23.251	0.409
57.937	0.489
81.075	0.559
110.924	0.605
130.178	0.629
143.786	0.809
165.228	1.164
172.128	1.373
186.624	1.461
202.128	1.606
218.212	2.476];
units.tW1  = {'d', 'g'}; label.tW1 = {'time since birth', 'wet weight', 'Gush Hulav Pond'};  
temp.tW1   = C2K(15); units.temp.tW1 = 'K'; label.temp.tW1 = 'temperature';
bibkey.tW1 = 'WarbDega1979';
comment.tW1 = 'Gush Hulav Pond';
% 
data.tW2 = [... % time since birth (d), wet weight (g)
6.826	0.313
40.402	0.209
110.736	0.370
176.236	0.499
218.658	0.633
306.533	1.081
348.142	1.399
397.037	2.409];
units.tW2  = {'d', 'g'}; label.tW2 = {'time since birth', 'wet weight', 'Sasa rock pool'};  
temp.tW2   = C2K(15); units.temp.tW2 = 'K'; label.temp.tW2 = 'temperature';
bibkey.tW2 = 'WarbDega1979';
comment.tW2 = 'Sasa rock pool';

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

%% Group plots
set1 = {'tW1','tW2'}; subtitle1 = {'Data for Gush Hulav Pond, Sasa rock pool'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'All temperatures are guessed';     
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Ovoviviparous; In some populations of the northern Iberian Peninsula females retain their offspring throughout development and give birth to fully metamorphosed terrestrial juveniles. (SK: neonates probably sport cannibalism in the uterus)';
metaData.bibkey.F1 = 'AlcoBuck2004'; 
F2 = 'Males are generally somewhat smaller';
metaData.bibkey.F2 = 'caudata'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '6XB2G'; % Cat of Life
metaData.links.id_ITIS = '668396'; % ITIS
metaData.links.id_EoL = '333311'; % Ency of Life
metaData.links.id_Wiki = 'Salamandra_salamandra'; % Wikipedia
metaData.links.id_ADW = 'Salamandra_salamandra'; % ADW
metaData.links.id_Taxo = '47311'; % Taxonomicon
metaData.links.id_WoRMS = '1507481'; % WoRMS
metaData.links.id_amphweb = 'Salamandra+salamandra'; % AmphibiaWeb
metaData.links.id_AnAge = 'Salamandra_salamandra'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Salamandra_salamandra}}';
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
bibkey = 'AlcoBuck2004'; type = 'Article'; bib = [ ... 
'author = {M. Alcobendas and D. Buckley and M. Tejedo}, ' ... 
'year = {2004}, ' ...
'title = {VARIABILITY IN SURVIVAL, GROWTH AND METAMORPHOSIS IN THE LARVAL FIRE SALAMANDER (\emph{Salamandra salamandra}): EFFECTS OF LARVAL BIRTH SIZE, SIBSHIP AND ENVIRONMENT}, ' ...
'journal = {Herpetologica}, ' ...
'number = {2}, ' ...
'volume = {60}, ' ...
'pages = {232--245}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'WarbDega1979'; type = 'Article'; bib = [ ... 
'author = {M . R. Warburg and G. Degani and I. Warburg}, ' ... 
'year = {1979}, ' ...
'title = {GROWTH AND POPULATION STRUCTURE OF \emph{Salamandra salamandra} ({L} .) LARVAE IN DIFFERENT LIMNOLOGICAL CONDITIONS}, ' ...
'journal = {Herpetologica}, ' ...
'number = {2}, ' ...
'volume = {64}, ' ...
'pages = {147--155}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'KoppBaur2000'; type = 'Article'; bib = [ ... 
'author = {M. Kopp and B. Baur}, ' ... 
'year = {2000}, ' ...
'title = {Intra- and inter-litter variation in life-history traits in a population of fire salamanders (\emph{Salamandra salamandra terrestris})}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {250}, ' ...
'pages = {231--236}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{http://amphibiaweb.org/species/4284}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Salamandra_salamandra}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'caudata'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.caudata.org/cc/species/Salamandra/Salamandra_sp.shtml}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

