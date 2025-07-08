function [data, auxData, metaData, txtData, weights] = mydata_Pteria_hirundo
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Pterioida'; 
metaData.family     = 'Pteriidae';
metaData.species    = 'Pteria_hirundo'; 
metaData.species_en = 'European wing-oyster'; 

metaData.ecoCode.climate = {'MB'};
metaData.ecoCode.ecozone = {'MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 02 22];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 02 22]; 

%% set data
% zero-variate data

data.am = 5*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 3.5;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'guess';
data.Li  = 8;      units.Li  = 'cm';  label.Li  = 'ultimate shell length';   bibkey.Li  = 'AlbuAlve2012';

data.Wwb = 3.35e-8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'guess';
  comment.Wwb = 'based on egg diameter of 40 mum: pi/6*0.004^3';
data.Wwi = 30.6; units.Wwi = 'g';   label.Wwi = 'flesh wet weight';   bibkey.Wwi = 'EoL';
  
data.GSI  = 0.3; units.GSI  = '-'; label.GSI  = 'gonado somatic index';     bibkey.GSI  = 'guess';   
  temp.GSI = C2K(22); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % time (month), shell length (cm)
    0 3.940
    1 4.200
    2 4.383
    3 4.550
    4 4.670
    5 5.100
    6 5.550];
data.tL(:,1) = data.tL(:,1)*30.5; % convert mnth to d 
units.tL   = {'d', 'cm'};  label.tL = {'time', 'shell length'};  
temp.tL    = [linspace(0,183,9); 24.607 26.944 27.258 27.843 26.225 22.135 18.360 16.292 24.607]';  
  units.temp.tL = {'d','C'}; label.temp.tL = {'time','temperature'};
bibkey.tL = 'AlbuAlve2012';
%
data.tL1 = [ ... % time (month), shell length (cm)
    0 4.530
    1 4.530
    2 4.610
    3 4.810
    4 5.033
    5 5.090
    6 5.670];
data.tL1(:,1) = data.tL1(:,1)*30.5; % convert mnth to d 
units.tL1   = {'d', 'cm'};  label.tL1 = {'time', 'shell length'};  
temp.tL1    = C2K(22);  units.temp.tL1 = 'K'; label.temp.tL1 = 'temperature';
bibkey.tL1 = 'AlbuAlve2012';
comment.tL1 = 'temperature trajectory is the same as for tL';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;
weights.tL1 = weights.tL1 * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tL','tL1'}; subtitle1 = {'Data for 2 initial lengths'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Facts
F1 = 'Since Pinctada is hermaphrodite, Pteria is that problably also: First male then female';
metaData.bibkey.F1 = {'MarcPrie2005'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4PTR3'; % Cat of Life
metaData.links.id_ITIS = '79597'; % ITIS
metaData.links.id_EoL = '46467346'; % Ency of Life
metaData.links.id_Wiki = 'Pteria'; % Wikipedia
metaData.links.id_ADW = 'Pteria_hirundo'; % ADW
metaData.links.id_Taxo = '39261'; % Taxonomicon
metaData.links.id_WoRMS = '140891'; % WoRMS
metaData.links.id_molluscabase = '140891'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pteria}}';
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
bibkey = 'AlbuAlve2012'; type = 'Article'; bib = [ ... 
'author = {Albuquerque, M. C. P. and Alves, R. and Zanandrea, A. C. V. and Ferreira, J. F. and Melo, C. M. R. and Magalh\~{a}es, A. R. M.}, ' ... 
'year = {2012}, ' ...
'title = {Growth and survival of the pearl oyster \emph{Pteria hirundo} ({L}.,1758) in an intermediate stage of culture in {S}anta {C}atarina, {B}razil}, ' ...
'journal = {Braz. J. Biol.}, ' ...
'volume = {72(1)}, ' ...
'pages = {175-180}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/46467346}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MarcPrie2005'; type = 'Article'; bib = [ ... 
'doi = {10.7773/cm.v31i2.55}, ' ...
'author = {Jes''{u}s S. Marcano and Antulio Prieto and Asdr\''{u}bal L\''{a}rez and Jos\''{e} J. Ali\''{o} and Hargadys Sanabria}, ' ... 
'year = {2005}, ' ...
'title = {Growth and mortality of \emph{Pinctada imbricata} ({M}ollusca: {P}teridae) in {G}uamachito, {A}raya {P}eninsula, {S}ucre {S}tate, {V}enezuela}, ' ...
'journal = {Ciencias Marinas}, ' ...
'volume = {31}, ' ...
'pages = {387-397}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

