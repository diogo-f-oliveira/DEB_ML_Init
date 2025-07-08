function [data, auxData, metaData, txtData, weights] = mydata_Corbicula_fluminea

%% set metaData
metaData.phylum     = 'Mollusca'; 
metaData.class      = 'Bivalvia'; 
metaData.order      = 'Venerida'; 
metaData.family     = 'Cyrenidae';
metaData.species    = 'Corbicula_fluminea'; 
metaData.species_en = 'Golden clam'; 

metaData.ecoCode.climate = {'A','C','D'};
metaData.ecoCode.ecozone = {'TH','TN','TPi'};
metaData.ecoCode.habitat = {'0iFr','0iFp'};
metaData.ecoCode.embryo  = {'Fbb'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTvf', 'jiPp'};
metaData.ecoCode.gender  = {'D', 'Hh'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(17); % K, body temp
metaData.data_0     = {'am'; 'Lb'; 'Lp'; 'Li'; 'Ww_L'; 'Ri'};
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; 

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2020 10 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator    = {'Starrlight Augustine'};                             
metaData.email_cur  = {'sta@akvaplan.niva.no'};                 
metaData.date_acc   = [2020 10 08];      


%% set data
% zero-variate data

data.am = 6.5*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'LiRype2017';   
  temp.am = C2K(17);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = .02;   units.Lb  = 'cm';  label.Lb  = 'shell height at birth';   bibkey.Lb  = 'Wiki';  
data.Lp  = 0.6;   units.Lp  = 'cm';  label.Lp  = 'shell height at puberty'; bibkey.Lp  = 'SousAntu2008'; 
  comment.Lp = 'based on shell length 0.6- 1cm';
data.Li  = 4.8;   units.Li  = 'cm';  label.Li  = 'ultimate shell height';   bibkey.Li  = 'Wiki';
  comment.Li = 'based on shell length 5 cm';

data.Wwi  = 12.17;   units.Wwi  = 'g';  label.Wwi  = 'body wet weight at SH 2.7 cm';   bibkey.Wwi  = 'Serd2018';

data.Ri = 68e3/365;    units.Ri = '#/d';    label.Ri = 'maximum reproduction rate'; bibkey.Ri = 'Wiki';   
  temp.Ri = C2K(17);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature'; 
 
% uni-variate data
  
% time-length
data.tL = [ ... % time since birth (yr), shell length (cm)
    1 1.110
    2 1.625
    3 1.995
    4 2.213
    5 2.556
    6 2.856];
data.tL(:,1) = 365 * (0 + data.tL(:,1));
units.tL = {'d', 'cm'}; label.tL = {'time', 'shell hight'};  
temp.tL = C2K(16.3);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'LiRype2017';


%% set weights for all real data
weights = setweights(data, []);
%weights.tL = 10 * weights.tL;
%weights.Lb = 2 * weights.Lb;
%weights.Ri = 2 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.p_M = 2 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Facts
F1 = 'Simultaneous hermaphroditic, but also dioecious';
metaData.bibkey.F1 = 'SousAntu2008'; 
F2 = 'The fertilization occurs inside the paleal cavity and larvae are incubated in branchial water tubes';
metaData.bibkey.F2 = 'SousAntu2008'; 
metaData.facts = struct('F1',F1, 'F2',F2);

%% Links
metaData.links.id_CoL = '5ZYZK'; % Cat of Life
metaData.links.id_ITIS = '81387'; % ITIS
metaData.links.id_EoL = '46470422'; % Ency of Life
metaData.links.id_Wiki = 'Corbicula_fluminea'; % Wikipedia
metaData.links.id_ADW = 'Corbicula_fluminea'; % ADW
metaData.links.id_Taxo = '39780'; % Taxonomicon
metaData.links.id_WoRMS = '181580'; % WoRMS
metaData.links.id_molluscabase = '181580'; % molluscabase

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Corbicula_fluminea}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/4749267}}';
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
bibkey = 'LiRype2017'; type = 'Article'; bib = [ ... 
'doi = {10.1086/693463}, ' ...
'author = {Jin Li and Andrew L. Rype and Shengyu Y. Zhang and Yuming M. Luo and Gang Hou and Brian R. Murphy and Songguang G. Xie}, ' ... 
'year = {2017}, ' ...
'title = {Growth, longevity, and climate-growth relationships of \emph{Corbicula fluminea} ({M}\"{u}ller, 1774) in {H}ongze {L}ake, {C}hina}, ' ...
'journal = {Freshwater Science}, ' ...
'volume = {36(3)}, ' ...
'pages = {595-608}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Serd2018'; type = 'Article'; bib = [ ... 
'doi = {10.2983/035.037.0304}, ' ...
'author = {Serdar, Serpil}, ' ... 
'year = {2018}, ' ...
'title = {Growth of the {A}sian Clam \emph{Corbicula fluminea} ({M}\"{u}ller, 1774) Cultured in \c{C}ine Creek, {A}ydin, {T}urkey}, ' ...
'journal = {Journal of Shellfish Research}, ' ...
'volume = {37(3)}, ' ...
'pages = {491-496}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SousAntu2008'; type = 'Article'; bib = [ ... 
'doi = {10.1051/limn:2008017}, ' ...
'author = {R. Sousa and C. Antunes and L. Guilhermino}, ' ... 
'year = {2008}, ' ...
'title = {Ecology of the invasive {A}sian clam \emph{Corbicula fluminea} ({M}\"{u}ller, 1774) in aquatic ecosystems: an overview}, ' ...
'journal = {Ann. Limnol. - Int. J. Lim.}, ' ...
'volume = {44(2)}, ' ...
'pages = {85-94}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
