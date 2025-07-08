function [data, auxData, metaData, txtData, weights] = mydata_Pteria_sterna
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Pterioida'; 
metaData.family     = 'Pteriidae';
metaData.species    = 'Pteria_sterna'; 
metaData.species_en = 'Rainbow-lipped pearl oyster'; 

metaData.ecoCode.climate = {'MA'};
metaData.ecoCode.ecozone = {'MPE'};
metaData.ecoCode.habitat = {'0jMp', 'jiMr'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'Hsm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27.5); % K, body temp
metaData.data_0     = {'am'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'GSI'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.4; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 04 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 04 27]; 

%% set data
% zero-variate data

data.am = 5*365;   units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(27.5);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lp  = 5.95;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'SernRuiz2014';
data.Li  = 9.5;      units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'SernRuiz2014';

data.Wwb = 3.35e-8; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'SernRuiz2014';
  comment.Wwb = 'based on egg diameter of 40 mum: pi/6*0.004^3';
data.Wwi = 119; units.Wwi = 'g';   label.Wwi = 'flesh wet weight';   bibkey.Wwi = 'guess';
  comment.Wwi = 'Based on 0.00007*(Li*10)^3.15 for Pinctada_imbricata';
  
data.GSI  = 0.3; units.GSI  = '-'; label.GSI  = 'gonado somatic index';     bibkey.GSI  = 'SernRuiz2014';   
  temp.GSI = C2K(27.5); units.temp.GSI = 'K'; label.temp.GSI = 'temperature';
  
% uni-variate data

% time-length
data.tL = [ ... % time (month), shell length (cm)
-1.315	1.288
26.293	1.665
53.901	2.212
81.509	2.589
108.678	3.786
136.724	3.760
163.017	4.658
191.063	4.827
217.795	5.361
245.402	5.673
273.010	5.933
300.618	5.933];
data.tL(:,1) = data.tL(:,1) - data.tL(1,1); % convert mnth to d 
units.tL   = {'d', 'cm'};  label.tL = {'time', 'shell length'};  
temp.tL    = C2K(27.5);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'SernRuiz2014';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = weights.tL * 5;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Facts
F1 = 'Since Pinctada is hermaphrodite, Pteria is that problably also: First male then female';
metaData.bibkey.F1 = {'MarcPrie2005'}; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4PTRZ'; % Cat of Life
metaData.links.id_ITIS = '568167'; % ITIS
metaData.links.id_EoL = '46467351'; % Ency of Life
metaData.links.id_Wiki = 'Pteria_sterna'; % Wikipedia
metaData.links.id_ADW = 'Pteria_sterna'; % ADW
metaData.links.id_Taxo = '554183'; % Taxonomicon
metaData.links.id_WoRMS = '464505'; % WoRMS
metaData.links.id_molluscabase = '464505'; % molluscabase


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pteria_sterna}}';
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
bibkey = 'SernRuiz2014'; type = 'Article'; bib = [ ... 
'doi = {10.7773/cm.v40i2.2393}, ' ...
'author = {Irene Serna-Gallo and Javier M. J. Ru\''{i}z-Velazco and H\''{e}ctor Acosta-Salm\''{o}n and Emilio Pena-Messina and Guadalupe Torres-Zepeda and Pedro E Saucedo}, ' ... 
'year = {2014}, ' ...
'title = {Growth and reproduction patterns of the winged pearl oyster, \emph{Pteria sterna}, cultivated in tropical environments of {M}exico: {I}mplications for pearl farming}, ' ...
'journal = {Ciencias Marinas}, ' ...
'volume = {40}, ' ...
'pages = {75-88}'];
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

