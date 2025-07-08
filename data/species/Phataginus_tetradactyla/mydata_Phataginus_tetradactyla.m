function [data, auxData, metaData, txtData, weights] = mydata_Phataginus_tetradactyla

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Pholidota'; 
metaData.family     = 'Manidae';
metaData.species    = 'Phataginus_tetradactyla'; 
metaData.species_en = 'Black-bellied pangolin'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(33.4); % K, body temp
metaData.data_0     = {'tg','tx','tp','am','Li','Wwb', 'Wwp','Wwi','Ri'}; 
metaData.data_1     = {}; 

metaData.COMPLETE = 1.5; % using criteria of LikaKear2011

metaData.author   = {'Starrlight Augustine'};    
metaData.date_subm = [2021 12 17];              
metaData.email    = {'sta@akvaplan.niva.no'};            
metaData.address  = {'Akvaplan-niva, FRAM center, Tromso'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 07 23];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 07 23];

%% set data
% zero-variate data

data.tg = 140;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'GudePiet2020';   
  temp.tg = metaData.T_typical;  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 3*30.5; units.tx = 'd';    label.tx = 'age at weaning'; bibkey.tx = 'GudePiet2020';   
  temp.tx = metaData.T_typical;  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'starts feeding a few weeks old, leaves mother when other one is born.';
data.tp = 2 * 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'GudePiet2020';
  temp.tp = metaData.T_typical;  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'estimated by authors';
data.am = 10*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = metaData.T_typical;  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'value from P. tricuspis (which was based on oldes one alive in a zoo).';
data.Lb = mean([30.0;35.0]); units.Lb = 'cm';   label.Lb = 'total length at birth';     bibkey.Lb = 'GudePiet2020';
    comment.Lb = 'range: 30-35 cm';
data.Li = 120; units.Li = 'cm';   label.Li = 'ultimate total length';     bibkey.Li = 'GudePiet2020'; 
data.Wwb = mean([100;150]);   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'GudePiet2020';
 comment.Wwb = 'range 100-150' ;

data.Wwp = 1.1e3;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';     bibkey.Wwp = 'GudePiet2020';
comment.Wwp = 'minimum adult weight reported'; 
data.Wwi = 3.6e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'GudePiet2020';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'GudePiet2020';   
  temp.Ri = metaData.T_typical;  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Females can get pregrant right after birth. I estimate 2 per year based on almost 6 months gestation time.';


%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'mod_1: k reduced';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7VRVG'; % Cat of Life
metaData.links.id_ITIS = '584933'; % ITIS
metaData.links.id_EoL = '49313189'; % Ency of Life
metaData.links.id_Wiki = 'Phataginus_tetradactyla'; % Wikipedia
metaData.links.id_ADW = 'Manis_tetradactyla'; % ADW
metaData.links.id_Taxo = '169327'; % Taxonomicon
metaData.links.id_MSW3 = '13900018'; % Mammal Spec World
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Phataginus_tetradactyla}}';
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
bibkey = 'GudePiet2020'; type = 'Incollection'; bib = [ ... 
'author = {Maja  and Darren W. Pietersen and Michael Hoffmann and Rod Cassidy and Tamar Cassidy and Olufemi Sodeinde and Juan Lapuente and Brou Guy-Mathieu Assovi and Matthew H. Shirley}, ' ... 
'doi = {10.1016/B978-0-12-815507-3.00008-3}, ' ...
'year = {2020}, ' ...
'title = {Black-bellied pangolin \emph{Phataginus tetradactyla} ({L}innaeus, 1766)}, ' ...
'booktitle = {Pangolins: Science, Society and Conservation}, ' ...
'pages = {123--138}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Manis_tetradactyla/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

