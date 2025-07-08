function [data, auxData, metaData, txtData, weights] = mydata_Neotamias_palmeri

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Neotamias_palmeri'; 
metaData.species_en = 'Palmer''s chipmunk'; 

metaData.ecoCode.climate = {'BSh','BSh'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf','0iTd'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiH'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(36); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 't-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 01];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 01]; 

%% set data
% zero-variate data

data.tg = 33;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'HirsBrad1977';   
  temp.tg = C2K(36);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 28;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'HirsBrad1977';   
  temp.tx = C2K(36);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 305;    units.tp = 'd';    label.tp = 'time since birth at puberty';   bibkey.tp = 'ADW';
  temp.tp = C2K(36);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 4*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(36);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li = 12.41;   units.Li = 'cm';   label.Li = 'ultimate head_body length';     bibkey.Li = 'HirsBrad1977';
    
data.Wwi = 69.4;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'ADW';

data.Ri  = 3.8/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'HirsBrad1977';   
  temp.Ri = C2K(36);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 litters per yr, 3.8 pups per litter';

% uni-variate data
% time - length
data.tL = [ ... % time (d), head+body length (cm)
    1  4.45
    2  5.32
    3  6.07
    4  6.38
    5  6.80
    6  9.44
    7 10.12
    8 10.56
    9 11.15
   10 11.63
   11 11.66
   12 12.20
   13 12.42];
data.tL(:,1) = 7 * data.tL(:,1);
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'head+body length'};  
temp.tL  = C2K(36);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HirsBrad1977';

% time-weight data
data.tWw = [ ... % time (d), weight (g)
    1  4.32
    2  7.29
    3  9.77
    4 11.13
    5 17.65
    6 21.22
    7 27.65
    8 35.91
    9 42.16
   10 48.12
   11 50.43
   12 52.11
   13 54.62];
data.tWw(:,1) = 7 * data.tWw(:,1);
units.tWw  = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(36);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'HirsBrad1977';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 10 * weights.tWw;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.t_0 = 0;  units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development';
%weights.psd.t_0 = 3;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7WYZB'; % Cat of Life
metaData.links.id_ITIS = '930326 '; % ITIS
metaData.links.id_EoL = '289509'; % Ency of Life
metaData.links.id_Wiki = 'Neotamias_palmeri'; % Wikipedia
metaData.links.id_ADW = 'Tamias_palmeri'; % ADW
metaData.links.id_Taxo = '61950'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '12401194'; % MSW3
metaData.links.id_AnAge = ''; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Neotamias_palmeri}}';
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
bibkey = 'HirsBrad1977'; type = 'Article'; bib = [ ... 
'author = {Joseph R. Hirshfeld and W. Glen Bradley}, ' ... 
'year = {1977}, ' ...
'title = {Growth and Development of Two Species of Chipmunks: \emph{Eutamias panamintinus} and \emph{E. palmeri}}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {58(1)}, ' ...
'pages = {44-52}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Tamias_palmeri/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
