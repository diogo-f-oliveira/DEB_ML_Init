function [data, auxData, metaData, txtData, weights] = mydata_Oligosoma_suteri

%% set metaData
metaData.phylum     = 'Chordata';
metaData.class      = 'Reptilia';
metaData.order      = 'Squamata';
metaData.family     = 'Scincidae';
metaData.species    = 'Oligosoma_suteri';
metaData.species_en = 'Suter''s skink';

metaData.ecoCode.climate = {'Cfb'};
metaData.ecoCode.ecozone = {'TAz'};
metaData.ecoCode.habitat = {'0iTd'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(25); % K, body temp
metaData.data_0     = {'ab_T'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'};

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};
metaData.date_subm = [2019 05 19];
metaData.email    = {'bas.kooijman@vu.nl'};
metaData.address  = {'VU University, Amsterdam'};

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'};
metaData.date_acc    = [2019 05 19];

%% set data
% zero-variate data;
data.ab22 = 77.5;     units.ab22 = 'd'; label.ab22 = 'age at birth';               bibkey.ab22 = 'Wiki';
  temp.ab22 = C2K(22);  units.temp.ab22 = 'K'; label.temp.ab22 = 'temperature';
  comment.ab22 = '75 to 80 d';
data.ab26 = 55;     units.ab26 = 'd'; label.ab26 = 'age at birth';               bibkey.ab26 = 'Wiki';
  temp.ab26 = C2K(26);  units.temp.ab26 = 'K'; label.temp.ab26 = 'temperature';
data.am = 44*365;     units.am = 'd'; label.am = 'life span';               bibkey.am = 'AnAge';
  temp.am = C2K(25);  units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'based on Oligosoma otagense as given in AnAge';

data.Lb  = 3.4;     units.Lb  = 'cm';  label.Lb  = 'SVL at birth';   bibkey.Lb  = 'HareLong2004';
data.Lp  = 5.4;    units.Lp  = 'cm';  label.Lp  = 'SVL at puberty for females'; bibkey.Lp  = 'HareLong2004';
  comment.Lp = 'assumin that tp = 1 yr';
data.Li  = 12.6; units.Li  = 'cm';  label.Li  = 'ultimate SVL for females';   bibkey.Li  = 'reptNZ';

data.Wwb = 0.75; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'HareLong2004';
data.Ww1 = 2.35; units.Ww1 = 'g';   label.Ww1 = 'wet weight at 1 yr';     bibkey.Ww1 = 'HareLong2004';
  temp.Ww1   = C2K(25);  units.temp.Ww1 = 'K'; label.temp.Ww1 = 'temperature';
data.Wwi = 32.52; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'EoL';

data.Ri  = 4.5/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'reptNZ';
  temp.Ri = C2K(25); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '3 to 6 eggs per clutch, 1 clutch per yr';

% univariate data
% time-length
data.tL = [ ... % age (d),  SVL (cm)
0.00	3.440
29.283	3.801
60.886	3.998
89.931	4.110
121.521	4.277
182.206	4.672
364.570	5.099];
units.tL  = {'d', 'cm'};  label.tL = {'time since birth', 'SVL'};  
temp.tL   = C2K(25);  units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'HareLong2004';

%% set weights for all real data
weights = setweights(data, []);
weights.tL = 10 * weights.tL;
weights.Lb = 5 * weights.Lb;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 2 * weights.psd.v;
weights.psd.k_J = 0; weights.psd.k = 0.2;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are supposed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Viviparous, with complex placenta';
metaData.bibkey.F1 = 'reptileDB'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '49787'; % Cat of Life
metaData.links.id_ITIS = ''; % ITIS
metaData.links.id_EoL = '791270'; % Ency of Life
metaData.links.id_Wiki = 'Oligosoma_suteri'; % Wikipedia
metaData.links.id_ADW = 'Oligosoma_suteri'; % ADW
metaData.links.id_Taxo = '643424'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Oligosoma&species=suteri'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oligosoma_suteri}}';   
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
bibkey = 'HareLong2004'; type = 'Article'; bib = [ ...  
'author = {Kelly M. Hare and Christopher G. Longson and Shirley Pledger and Charles H. Daugherty}, ' ...
'title = {Size, Growth, and Survival Are Reduced at Cool Incubation Temperatures in the Temperate Lizard \emph{Oligosoma suteri} ({L}acertilia: {S}cincidae)}, ' ...
'journal = {Copeia}, ' ...
'volume = {2004(2)}, ' ...
'pages = {383-390}, ' ...
'year = {2004}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'reptileDB'; type = 'Misc'; bib = ...
'howpublished = {\url{https://reptile-database.reptarium.cz/species?genus=Oligosoma&species=suteri}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/query.php?search=Oligosoma}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/791270}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'reptNZ'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.reptiles.org.nz/herpetofauna/native/oligosoma-suteri}}';   
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];



