function [data, auxData, metaData, txtData, weights] = mydata_Funambulus_pennantii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Rodentia'; 
metaData.family     = 'Sciuridae';
metaData.species    = 'Funambulus_pennantii'; 
metaData.species_en = 'Northern palm squirrel'; 

metaData.ecoCode.climate = {'BSk', 'Cfa', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTf'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHs', 'xiC'};
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

data.tg = 40;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(38.7);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 61;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(38.7);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 234 ;    units.tp = 'd';    label.tp = 'time since birth at puberty for female'; bibkey.tp = 'AnAge';
  temp.tp = C2K(38.7);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 310 ;    units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(38.7);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 12*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'guess';   
  temp.am = C2K(38.7);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'AnAge: at least 8 yr';

data.Wwb = 6.5;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'AnAge';
data.Wwi = 147.7; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for female';  bibkey.Wwi = 'AnAge';

data.Ri  = 2.5*3.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';      bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(38.7);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3.5 pups per litter; 2.5 litters per yr';
  
% uni-variate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
0.047	7.102
7.080	11.258
13.894	13.349
20.712	16.620
27.313	18.416
34.338	19.624
42.223	24.078
49.469	28.528
55.877	37.102
63.548	41.260
69.937	43.349
76.756	46.914
84.219	52.840
91.463	56.407
98.516	67.635
105.099	62.947];
units.tWw = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw  = C2K(38.7);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'PuroKame1966';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 10 * weights.tWw;
weights.Wwi = 3 * weights.Wwi;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.t_0 = 0; units.psd.t_0 = 'd'; label.psd.t_0 = 'time at start development'; 
%weights.psd.t_0 = 0.1;
weights.psd.p_M = 5 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1);

%% Links
metaData.links.id_CoL = '7TYVM'; % Cat of Life
metaData.links.id_ITIS = '632353'; % ITIS
metaData.links.id_EoL = '313086'; % Ency of Life
metaData.links.id_Wiki = 'Funambulus_pennantii'; % Wikipedia
metaData.links.id_ADW = 'Funambulus_pennantii'; % ADW
metaData.links.id_Taxo = '93431'; % Taxonomicon
metaData.links.id_MSW3 = '12400576'; % Mammal Spec World
metaData.links.id_AnAge = 'Funambulus_pennantii'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Funambulus_pennantii}}';
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
bibkey = 'PuroKame1966'; type = 'Article'; bib = [ ...  
'doi = {10.1515/mamm.1966.30.4.538}, ' ...
'author = {Purohit, K. G. and Kametkar, L. R. and Prakash, I.}, ' ...
'year = {1966}, ' ...
'title  = {REPRODUCTION BIOLOGY AND POST-NATAL DEVELOPMENT IN THE NORTHERN PALM SQUIRREL \emph{Funambulus pennantii} {W}ROUGHTON}, ' ...
'journal = {Mammalia}, ' ...
'volume = {30(4)}, ' ...
'pages = {370–400}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Funambulus_pennantii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Funambulus_pennantii/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

