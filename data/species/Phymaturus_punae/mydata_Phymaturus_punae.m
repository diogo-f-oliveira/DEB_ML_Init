function [data, auxData, metaData, txtData, weights] = mydata_Phymaturus_punae
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Liolaemidae';
metaData.species    = 'Phymaturus_punae'; 
metaData.species_en = 'Cei''s  mountain lizard'; 

metaData.ecoCode.climate = {'BWk'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iTs'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(15); % K, body temp
metaData.data_0     = {'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.2; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 01 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 01 10];

%% set data
% zero-variate data

data.tp = 8*365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'BoreCabe2015';   
  temp.tp = C2K(15); units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 20*365;  units.am = 'd';    label.am = 'life span';                bibkey.am = 'BoreCabe2015';   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 5.1;   units.Lb  = 'cm';  label.Lb  = 'SVL at birth'; bibkey.Lb  = 'BoreCabe2015';  
data.Lp  = 8.3;   units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'BoreCabe2015';  
data.Lpm  = 9.1;    units.Lpm = 'cm';  label.Lpm = 'SVL at puberty for males';  bibkey.Lpm  = 'BoreCabe2015';
data.Li  = 9.2;     units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';  bibkey.Li  = 'BoreCabe2015';  
data.Lim  = 10.4;     units.Lim  = 'cm';  label.Lim  = 'ultimate SVL for males';  bibkey.Lim  = 'BoreCabe2015';  

data.Wwi = 37.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';       bibkey.Wwi = 'EoL';

data.Ri  = 1.5/365/2;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate'; bibkey.Ri  = 'BoreCabe2015';   
  temp.Ri = C2K(15);   units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-2 young per clutch, 1 clutch each 2 yr';

% univariate data
% time -  length data
data.tL = [ ... % age (yr),  SVL (cm)
 0	5.083
 5	7.982
 6	7.776
 6	8.270
 9	8.049
 9	8.463
 9	8.208
12	8.863
12	9.436
13	8.912
13	8.657
14	9.596
15	9.613
15	8.929
15	9.422
16	10.250
16	9.343
17	9.153
18	9.170
18	10.395
18	9.441
20	10.460];
data.tL(:,1) = 365 * data.tL(:,1);
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'BoreCabe2015';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 5 * weights.tL;
weights.Lb = 5 * weights.Lb;
weights.Li = 5 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'Temperatures are guessed';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'Viviparous, herbivorous';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6VGQS'; % Cat of Life
metaData.links.id_ITIS = '1056565'; % ITIS
metaData.links.id_EoL = '791063'; % Ency of Life
metaData.links.id_Wiki = 'Phymaturus_punae'; % Wikipedia
metaData.links.id_ADW = 'Phymaturus_punae'; % ADW
metaData.links.id_Taxo = '643957'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Phymaturus&species=punae'; % ReptileDB
metaData.links.id_AnAge = 'Phymaturus_punae'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Phymaturus_punae}}';
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
bibkey = 'BoreCabe2015'; type = 'Article'; bib = [ ... 
'doi = {10.1111/jzo.12245}, ' ...
'author = {Boretto, J. M. and Cabezas-Cartes, F. and Ibargüengoytía, N. R.}, ' ... 
'year = {2015}, ' ...
'title = {Energy allocation to growth and reproduction in a viviparous lizard endemic to the highlands of the Andes, Argentina}, ' ...
'pages = {77–86}, ' ...
'volume = {297(1)}, ' ...
'journal = {Journal of Zoology}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Phymaturus_punae}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/791063}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

