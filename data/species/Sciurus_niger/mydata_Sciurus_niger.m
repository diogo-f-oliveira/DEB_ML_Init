function [data, auxData, metaData, txtData, weights] = mydata_Sciurus_niger

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Sciurus_niger'; 
metaData.species_en = 'Fox squirrel'; 

metaData.ecoCode.climate = {'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(38.7); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 11 11];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 11 11]; 

%% set data
% zero-variate data

data.tg = 44;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 84;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 373;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 16*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(38.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Wwb = 15;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwi = 800; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';  bibkey.Wwi = 'AnAge';

data.Ri  = 3/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'ADW';   
  temp.Ri = C2K(38.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 pups per litter; 1 litter per yr';
  
% uni-variate data
% time-weight
data.tWw = [ ... % time since birth (wk), weight (pound)
    1 0.05
    2 0.12
    3 0.15
    4 0.23
    5 0.31
    6 0.36
    7 0.41
    8 0.45];
data.tWw(:,1) = 7 * data.tWw(:,1); % convert wk to d
data.tWw(:,2) = data.tWw(:,2) * 453.59237; % convert pound to g
units.tWw = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(38.7);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'BrowYeag1945';

%% set weights for all real data
weights = setweights(data, []);
weights.Wwi = 5 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
weights.psd.t_0 = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7WTG9'; % Cat of Life
metaData.links.id_ITIS = '180172'; % ITIS
metaData.links.id_EoL = '347428'; % Ency of Life
metaData.links.id_Wiki = 'Sciurus_niger'; % Wikipedia
metaData.links.id_ADW = 'Sciurus_niger'; % ADW
metaData.links.id_Taxo = '61716'; % Taxonomicon
metaData.links.id_MSW3 = '12400176'; % Mammal Spec World
metaData.links.id_AnAge = 'Sciurus_niger'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Sciurus_niger}}';
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
bibkey = 'BrowYeag1945'; type = 'Article'; bib = [ ...  
'author = {Brown, L. G. and L. E. Yeager}, ' ...
'year = {1945}, ' ...
'title  = {Fox squirrels and gray squirrels in {I}llinois}, ' ...
'journal = {Bull. Illinois Nat. Hist. Survey}, ' ...
'volume = {23(5)}, ' ...
'pages = {445-536}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Sciurus_niger}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Sciurus_niger/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

