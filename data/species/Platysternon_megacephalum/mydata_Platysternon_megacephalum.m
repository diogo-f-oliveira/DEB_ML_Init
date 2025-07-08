function [data, auxData, metaData, txtData, weights] = mydata_Platysternon_megacephalum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Platysternidae';
metaData.species    = 'Platysternon_megacephalum'; 
metaData.species_en = 'Big-headed turtle'; 

metaData.ecoCode.climate = {'Cwa'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0bTd', 'biFc'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCim', 'biCvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lp'; 'Li'; 'Wwb'; 'Ri'}; 
metaData.data_1     = {'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 08];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 08];

%% set data
% zero-variate data

data.ab = 107;       units.ab = 'd';    label.ab = 'age at birth';                       bibkey.ab = 'SungHau2014';
  temp.ab = C2K(25); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 8*365;       units.tp = 'd';    label.tp = 'time since birth at puberty for female';  bibkey.tp = 'SungHau2015';
  temp.tp = C2K(15); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 13*365;       units.tpm = 'd';    label.tpm = 'time since birth at puberty for male'; bibkey.tpm = 'SungHau2015';
  temp.tpm = C2K(15); units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 27*365;  units.am = 'd';    label.am = 'life span';                            bibkey.am = 'AnAge';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'all temps based on EoL';

data.Lp = 10; units.Lp = 'cm';  label.Lp = 'carapace length at puberty for females';     bibkey.Lp = 'SungHau2015';
data.Lpm = 13; units.Lpm = 'cm';   label.Lpm = 'carapace length at puberty for males';   bibkey.Lpm = 'SungHau2015';
data.Li = 15; units.Li = 'cm';   label.Li = 'ultimate carapace length for females';      bibkey.Li = 'SungHau2015';
data.Lim = 20.1; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';   bibkey.Lim = 'arkive';

data.Wwb = 9.4; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';                    bibkey.Wwb = 'ADW';
  comment.Wwb = 'based on egg length 37 mm and width 22 mm: pi/6*2.2^2*3.7';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';                  bibkey.Ri  = 'SungHau2014';   
  temp.Ri = C2K(15);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% length-weight
data.LW = [ ... % plastron length (cm), wet weight (g)
 8.88 180
 9.04 276
12.71 595
12.72 624];
units.LW   = {'cm', 'g'};  label.LW = {'plastron length', 'wet weight'};  
bibkey.LW = 'SungHau2014';
comment.LW = 'Data for females';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} and E_Hb only'; 
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'opportunistic carnivore';
metaData.bibkey.F1 = 'ADW'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4JZ39'; % Cat of Life
metaData.links.id_ITIS = '551846'; % ITIS
metaData.links.id_EoL = '791024'; % Ency of Life
metaData.links.id_Wiki = 'Platysternon_megacephalum'; % Wikipedia
metaData.links.id_ADW = 'Platysternon_megacephalum'; % ADW
metaData.links.id_Taxo = '48515'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Platysternon&species=megacephalum'; % ReptileDB
metaData.links.id_AnAge = 'Platysternon_megacephalum'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Platysternon_megacephalum}}';
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
bibkey = 'SungHau2015'; type = 'Article'; bib = [ ...  
'author = {Y.-H. Sung and B. C. H. Hau and M. W. N. Lau and P. A. Crow and R. C. Kendrick and K. A. Buhlmann and G. W. J. Ades and N. E. Karraker}, ' ...
'year = {2015}, ' ...
'title  = {Growth Rate and an Evaluation of Age Estimation for the Endangered Big-Headed Turtle (\emph{Platysternon megacephalum}) in {C}hina}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {49}, ' ...
'number = {1}, ' ...
'pages = {99--103}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'SungHau2014'; type = 'Article'; bib = [ ...  
'author = {Y.-H. Sung and B. C. H. Hau and N. E. Karraker}, ' ...
'year = {2014}, ' ...
'title  = {Reproduction of endangered Big-headed Turtle, \emph{Platysternon megacephalum} ({R}eptilia: {T}estudines: {P}latysternidae}, ' ...
'journal = {Acta Herpetologica}, ' ...
'volume = {9}, ' ...
'number = {2}, ' ...
'pages = {243--247}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Platysternon_megacephalum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{http://eol.org/pages/791024/details}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'iucn'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.iucnredlist.org/details/17585/0}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Platysternon_megacephalum/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'arkive'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.arkive.org/big-headed-turtle/platysternon-megacephalum/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

