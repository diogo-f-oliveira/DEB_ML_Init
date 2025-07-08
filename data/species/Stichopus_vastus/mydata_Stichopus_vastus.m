function [data, auxData, metaData, txtData, weights] = mydata_Stichopus_vastus

%% set metaData
metaData.phylum     = 'Echinodermata'; 
metaData.class      = 'Holothuroidea'; 
metaData.order      = 'Aspidochirotida'; 
metaData.family     = 'Stichopodidae';
metaData.species    = 'Stichopus_vastus'; 
metaData.species_en = 'Curryfish'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MI'};
metaData.ecoCode.habitat = {'0jMcp', 'jiMb'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biP', 'bjHa'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'aj'; 'ap'; 'am'; 'Lj'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 09 21];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 09 21]; 

%% set data
% zero-variate data

data.ab = 1;    units.ab = 'd';    label.ab = 'age at birth';    bibkey.ab = 'guess';
  temp.ab = C2K(27);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'all temps are guessed; guess of ab based on Holothuria_scabra';
data.tj = 15;    units.tj = 'd';    label.tj = 'time since birth at metam';    bibkey.tj = 'guess';
  temp.tj = C2K(27);  units.temp.tj = 'K'; label.temp.tj = 'temperature';
  comment.tj = 'temp guessed';
data.tp = 365;    units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'guess based on Holothuria_scabra';
data.am = 5.5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'SulaPray2012';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lj  = 1;     units.Lj  = 'cm';  label.Lj  = 'length at metam';          bibkey.Lj  = 'guess';
  comment.Lj = 'guess based on Holothuria_scabra';
data.Lp  = 22;    units.Lp  = 'cm';  label.Lp  = 'test diameter at puberty';  bibkey.Lp  = 'guess';
  comment.Lp = 'guess based on Holothuria_scabra';
data.Li  = 50;    units.Li  = 'cm';  label.Li  = 'ultimate test length';   bibkey.Li  = 'Wiki';

data.Wwb = 4.2e-6;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'guess';
  comment.Wwb = 'computed from egg diameter of 200 mum based on Holothuria_scabra: pi/6*0.02^3';
data.Wwp = 182;      units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'computed as (Lp/Li)^3 * Wwi';
data.Wwi = 2850;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'Wiki';
  comment.Wwi = 'computed as (45/40)^3 * Wwi of Holothuria_scabra';

data.Ri = 17e6/365;    units.Ri = '#/d';    label.Ri = 'max reprod rate';        bibkey.Ri = 'guess';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'guess based on Holothuria_scabra';
 
% univariate data
% time-length
data.tL = [ ... % time since metam (yr), body length (cm)
    1  2.042
    2 14.538
    3 21.747
    4 25.906
    5 28.306
    6 29.691];
data.tL(:,1) = 365 * (-0.95 + data.tL(:,1)); % convert yr to d
units.tL   = {'d', 'cm'};  label.tL = {'time since metam', 'body length'};  
temp.tL    = C2K(27);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SulaPray2012';
comment.tL = 'data from Karimunjawa';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Life span of related Holothuria_scabra is much larger';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Planktontic 9 d auricularian larva, 5 d doliolarian larva, then settle as pentactular larva';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '52JBN'; % Cat of Life
metaData.links.id_ITIS = '1078740'; % ITIS
metaData.links.id_EoL = '3067730'; % Ency of Life
metaData.links.id_Wiki = 'Stichopus_vastus'; % Wikipedia
metaData.links.id_ADW = ''; % ADW
metaData.links.id_Taxo = '3930804'; % Taxonomicon
metaData.links.id_WoRMS = '242062'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Stichopus}}';
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
bibkey = 'SulaPray2012'; type = 'Article'; bib = [ ... 
'author = {B. Sulardiono and S. B. Prayitno and B. Hendrarto}, ' ... 
'year = {2012}, ' ...
'title = {THE GROWTH ANALYSIS OF \emph{Stichopus vastus} ({E}chinodermata: {S}tichopodidae) IN {K}ARIMUNJAWA WATERS}, ' ...
'journal = {Journal of Coastal Development}, ' ...
'volume = {15}, ' ...
'pages = {315--323}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iucn'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/180545/0}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

