function [data, auxData, metaData, txtData, weights] = mydata_Arctocephalus_forsteri
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Otariidae';
metaData.species    = 'Arctocephalus_forsteri'; 
metaData.species_en = 'Australasian fur seal'; 

metaData.ecoCode.climate = {'ME'};
metaData.ecoCode.ecozone = {'MIS', 'MPS'};
metaData.ecoCode.habitat = {'0iMc'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCvf', 'xiCic'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.5); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman','Starrlight Augustine'};    
metaData.date_subm = [2018 11 02];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 11 02]; 

%% set data
% zero-variate data

data.tg = 236;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'AnAge';   
  temp.tg = C2K(37.5);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'Temp for Zalophus_californianus';
data.tx = 335;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(37.5);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 5*365;   units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'AnAge';
  temp.tp = C2K(37.5);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 5*365;  units.tpm = 'd';   label.tpm = 'time since birth at puberty'; bibkey.tpm = 'AnAge';
   temp.tpm = C2K(37.5);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 30.6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(37.5);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'data for Arctocephalus australis';
  
data.Wwb = 3600; units.Wwb = 'g';  label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
  comment.Wwb = '3.3 to 3.9 kg';
data.Wwi = 40e3; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'AnAge';
  comment.Wwi = '30 to 50 kg';
data.Wwim = 126e3; units.Wwim = 'g'; label.Wwim = 'ultimate wet weight for males';  bibkey.Wwim = 'Wiki';
  comment.Wwim = 'Wiki: to 160 kg';

data.Ri  = 1/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(37.5); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  
% uni-variate data
% t-W data 
data.tW = [ ... % time since birth (d), weight (g)
 55  6377 % m
 55  7215 % m
 55  5827 % f
 55  6294 % f
140  7256 % m
140 11085 % m
140  6573 % f
140 10092 % f
235 10067 % m
235 12337 % m
235  9060 % f
235 11274 % f
290 14063 % m
290 12607 % m
];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'weight'};  
temp.tW    = C2K(38.1);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'Matt1981';
comment.tW = 'Data from Open Bay Islands (NZ), male and female pups combined';

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hp only';
D2 = 'Male {p_Am} jumps upward at puberty, as discussed in Kooy2014 under type A acceleration';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Acknowledgment
metaData.acknowledgment = 'The creation of this entry was supported by the Norwegian Science Council (NFR 255295)';

%% Links
metaData.links.id_CoL = '5VRR3'; % Cat of Life
metaData.links.id_ITIS = '180631'; % ITIS
metaData.links.id_EoL = '328621'; % Ency of Life
metaData.links.id_Wiki = 'Arctocephalus_forsteri'; % Wikipedia
metaData.links.id_ADW = 'Arctocephalus_forsteri'; % ADW
metaData.links.id_Taxo = '67385'; % Taxonomicon
metaData.links.id_WoRMS = '477318'; % WoRMS
metaData.links.id_MSW3 = '14000999'; % MSW3
metaData.links.id_AnAge = 'Arctocephalus_forsteri'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Arctocephalus_forsteri}}';
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
bibkey = 'Matt1981'; type = 'Article'; bib = [ ... 
'author = {R. H. Mattlin}, ' ... 
'year = {1981}, ' ...
'title = {Pup growth of the {N}ew {Z}ealand fur seal \emph{Arctocephalus forsteri} on the {O}pen {B}ay {I}slands, {N}ew {Z}ealand}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {193}, ' ...
'pages = {305-314}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Arctocephalus_forsteri}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/328621/overview}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


