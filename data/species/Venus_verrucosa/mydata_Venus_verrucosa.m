function [data, auxData, metaData, txtData, weights] = mydata_Venus_verrucosa
%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Venerida'; 
metaData.family     = 'Veneridae';
metaData.species    = 'Venus_verrucosa'; 
metaData.species_en = 'Warty venus'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MANE','MAm'};
metaData.ecoCode.habitat = {'0jMp', 'jiMb', 'jiMi'};
metaData.ecoCode.embryo  = {'Mb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPp'};
metaData.ecoCode.gender  = {'D','Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Li'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'}; 
metaData.data_1     = {'t-L_T'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 03 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 03 08]; 

%% set data
% zero-variate data

data.am = 14*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'PehaPopo2013';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature';
  
data.Lj  = 0.05; units.Lj  = 'cm';  label.Lj  = 'shell length at settling'; bibkey.Lj  = 'guess';
data.Lp  = 2.58; units.Lp  = 'cm';  label.Lp  = 'shell length at puberty'; bibkey.Lp  = 'PopoMlad2013';
data.Li  = 5.5;   units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'PehaPopo2013';

data.Wwb = 2.3e-6; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'PopoMlad2013';
  comment.Wwb = 'based onegg diameter of 164 mum: pi/6*0.0164^3';
data.Wwi = 37.9; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'sealifebase';
  comment.Wwi = 'based on 0.1591*Li^3.210, see F1';

data.GSI  = 0.05; units.GSI  = '-';  label.GSI  = 'gonado somatic index';        bibkey.GSI  = 'PopoMlad2013';   
  temp.GSI = C2K(21);  units.temp.GSI = 'K'; label.temp.GSI = 'temperature';

% uni-variate data

% time-length 
data.tLS = [ ... % time since settlement (yr), shell length (cm)
    1 1.693
    2 2.405
    3 3.027
    4 3.448
    5 3.827
    6 4.051
    7 4.266
    8 4.486
    9 4.602
   10 4.966
   11 5.254
   12 5.417];
data.tLS(:,1) = 365 * (0.5+data.tLS(:,1)); % convert yr to cm
units.tLS   = {'d', 'cm'};  label.tLS = {'time since settlement', 'shell length', 'Starigard, Croatia'};  
temp.tLS    = C2K(21);  units.temp.tLS = 'K'; label.temp.tLS = 'temperature';
bibkey.tLS = 'PehaPopo2013';
comment.tLS = 'Data from Starigard, Croatia';
%
data.tLN = [ ... % time since settlement (yr), shell length (cm)
    1 1.631
    2 2.438
    3 3.082
    4 3.564
    5 3.919
    6 4.192
    7 4.368
    8 4.537
    9 4.688
   10 4.834
   11 4.968
   12 5.100
   13 5.247
   14 5.459];
data.tLN(:,1) = 365 * (0.5+data.tLN(:,1)); % convert yr to cm
units.tLN   = {'d', 'cm'};  label.tLN = {'time since settlement', 'shell length', 'Ston, Croatia'};  
temp.tLN    = C2K(21);  units.temp.tLN = 'K'; label.temp.tLN = 'temperature';
bibkey.tLN = 'PehaPopo2013';
comment.tLN = 'Data from Ston, Croatia';
%
data.tLP = [ ... % time since settlement (yr), shell length (cm)
    1 1.467
    2 2.174
    3 2.847
    4 3.418
    5 3.842
    6 4.179
    7 4.433
    8 4.669
    9 4.877
   10 5.083
   11 5.131
   12 5.290];
data.tLP(:,1) = 365 * (0.5+data.tLP(:,1)); % convert yr to cm
units.tLP   = {'d', 'cm'};  label.tLP = {'time since settlement', 'shell length', 'Pag, Croatia'};  
temp.tLP    = C2K(21);  units.temp.tLP = 'K'; label.temp.tLP = 'temperature';
bibkey.tLP = 'PehaPopo2013';
comment.tLP = 'Data from Pag, Croatia';
%
data.tLK = [ ... % time since settlement (yr), shell length (cm)
    1 1.613
    2 2.387
    3 3.116
    4 3.758
    5 4.332
    6 4.708
    7 5.016
    8 5.332
    9 5.544
   10 5.597];
data.tLK(:,1) = 365 * (0.5+data.tLK(:,1)); % convert yr to cm
units.tLK   = {'d', 'cm'};  label.tLK = {'time since settlement', 'shell length', 'Kastela, Croatia'};  
temp.tLK    = C2K(21);  units.temp.tLK = 'K'; label.temp.tLK = 'temperature';
bibkey.tLK = 'PehaPopo2013';
comment.tLK = 'Data from Kastela, Croatia';
%
data.tLI = [ ... % time since settlement (yr), shell length (cm)
    1 1.571
    2 2.396
    3 3.103
    4 3.563
    5 3.878
    6 4.100
    7 4.302
    8 4.422
    9 4.588
   10 4.707
   11 5.014];
data.tLI(:,1) = 365 * (0.5+data.tLI(:,1)); % convert yr to cm
units.tLI   = {'d', 'cm'};  label.tLI = {'time since settlement', 'shell length', 'Istria, Croatia'};  
temp.tLI    = C2K(21);  units.temp.tLI = 'K'; label.temp.tLI = 'temperature';
bibkey.tLI = 'PehaPopo2013';
comment.tLI = 'Data from Istria, Croatia';

%% set weights for all real data
weights = setweights(data, []);
weights.Li = 5 * weights.Li;
weights.tLS = 5 * weights.tLS;
weights.tLN = 5 * weights.tLN;
weights.tLP = 5 * weights.tLP;
weights.tLK = 5 * weights.tLK;
weights.tLI = 5 * weights.tLI;


%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; weights.psd.k = 1; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
%weights.psd.v = 2 * weights.psd.v;
%weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'tLS','tLN','tLP','tLK','tLI'}; subtitle1 = {'Data from Starigard, Ston, Pag, Kastela, Istria'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% discussion
D1 = 'Temperature in C for tL data varies with time in d as T(t)=11+4*sin(2*pi*(t+8)/365)';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'length-weight: Ww in g = 0.1591*(shell length in cm)^3.210';
metaData.bibkey.F1 = 'sealifebase'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '7FNZ4'; % Cat of Life
metaData.links.id_ITIS = '81594'; % ITIS
metaData.links.id_EoL = '46469661'; % Ency of Life
metaData.links.id_Wiki = 'Venus_verrucosa'; % Wikipedia
metaData.links.id_ADW = 'Venus_verrucosa'; % ADW
metaData.links.id_Taxo = '39706'; % Taxonomicon, server down
metaData.links.id_WoRMS = '141936'; % WoRMS
metaData.links.id_molluscabase = '141936'; % MolluscaBase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Venus_verrucosa}}';
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
bibkey = 'PehaPopo2013'; type = 'Article'; bib = [ ... 
'author = {Melita Peharda and Zvjezdana Popovi\''{c} and Daria Ezgeta-Bali\''{c} and Nedo Vrgo\v{c} and Sanja Puljas and Anamarija Franki\''{c}}, ' ... 
'year = {2013}, ' ...
'title = {Age and growth of \emph{Venus verrucosa} ({B}ivalvia: {V}eneridae) in the eastern {A}driatic {S}ea}, ' ...
'journal = {Cah. Biol. Mar.}, ' ...
'volume = {54}, ' ...
'pages = {281-286}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'PopoMlad2013'; type = 'Article'; bib = [ ... 
'doi = {10.1080/17451000.2012.731690}, ' ...
'author = {Zvjezdana Popovi\''{c} and Ivona Mladineo and Daria Ezgeta-Bali\''{c} and Zeljka Trumbi\''{c} and Nedo Vrgo\v{c} and Melita Peharda}, ' ... 
'year = {2013}, ' ...
'title = {Reproductive cycle and gonad development of \emph{Venus verrucosa} {L}. ({B}ivalvia: {V}eneridae) in {K}a\v{s}tela {B}ay, {A}driatic {S}ea}, ' ...
'journal = {Marine Biology Research}, ' ...
'volume = {9(3)}, ' ...
'pages = {274-284}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'sealifebase'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.sealifebase.ca/summary/Venus-verrucosa.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

