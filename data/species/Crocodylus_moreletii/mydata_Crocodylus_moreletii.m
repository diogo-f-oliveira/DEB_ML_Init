function [data, auxData, metaData, txtData, weights] = mydata_Crocodylus_moreletii

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Crocodilidae';
metaData.species    = 'Crocodylus_moreletii'; 
metaData.species_en = 'Mexican crocodile'; 

metaData.ecoCode.climate = {'Am'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0bFe'};
metaData.ecoCode.embryo  = {'Tl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bpCi', 'biCv'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(23.7); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L0-Lt', 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2018 07 27];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 07 27];


%% set data
% zero-variate data

data.ab = 80;        units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(23.7); units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = '75 till 80 d';
data.tp = 8*365;        units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Wiki';   
  temp.tp = C2K(25); units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 42*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(23.7); units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 24.5;       units.Lb  = 'cm';  label.Lb  = 'total length at birth';   bibkey.Lb  = 'PereRang1995';  
data.Lp  = 150;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty'; bibkey.Lp  = 'Wiki'; 
data.Li  = 250;      units.Li  = 'cm';  label.Li  = 'ultimate total length for female'; bibkey.Li  = 'Wiki';
data.Lim  = 300;      units.Lim  = 'cm';  label.Lim  = 'ultimate total length for male'; bibkey.Lim  = 'Wiki';

data.Wwb = 46.2;       units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'PereRang1995';
data.Wwi = 48.5e3;    units.Wwi = 'g';   label.Wwi = 'ultimate wet weight of female'; bibkey.Wwi = 'Wiki';
  comment.Wwi = 'based on Wwim*(Li/Lim)^3';
data.Wwim = 83.9e3;     units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'Wiki';

data.Ri  = 30/365;   units.Ri  = '#/d'; label.Ri  = 'max reprod rate';   bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(23.7); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'bwteen 20 and 45 eggs per litter';
 
% uni-variate data

% time-length Data 
data.tL = [ ... % time since birth (yr), total (cm)
0 24.5
1 40.7
2 65.7
3 82.6];
units.tL   = {'d', 'cm'};  label.tL = {'time since birth', 'total length'};  
temp.tL = C2K(29); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = {'PereRang1995'};

% time-weight data
data.tW = [ ... % time since birth (y), weight (g)
    0   46.2
    1  194.7
    2  726.7
    3 1368.3];
units.tW   = {'d', 'cm'};  label.tW = {'time since birth', 'weight'};  
temp.tW = C2K(29); units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = {'PereRang1995'};
  
%% set weights for all real data
weights = setweights(data, []);
weights.tp = 0 * weights.tp;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
data.psd.k = 0.3; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.k = 2 * weights.psd.k_J; weights.psd.k_J = 0;
weights.psd.p_M = 8 * weights.psd.p_M;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'tp of roughly 7 till 8 yr in ignored, because of inconsistence with tL and Lp data';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Facts
F1 = 'temperature effects sex of neonate'; %: below  31.1 C are female; above 32.7 C neonates are male; no hatch below 27.8 C';
metaData.bibkey.F1 = 'ADW'; 
F2 = 'the only crocodile known to be exclusively mound nesting';
metaData.bibkey.F2 = 'ADW'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = 'ZKNH'; % Cat of Life
metaData.links.id_ITIS = '174362'; % ITIS
metaData.links.id_EoL = '795280'; % Ency of Life
metaData.links.id_Wiki = 'Crocodylus_moreletii'; % Wikipedia
metaData.links.id_ADW = 'Crocodylus_moreletii'; % ADW
metaData.links.id_Taxo = '50632'; % Taxonomicon
metaData.links.id_WoRMS = '1476232'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Crocodylus&species=moreletii'; % ReptileDB
metaData.links.id_AnAge = 'Crocodylus_moreletii'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Crocodylus_moreletii}}';
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
bibkey = 'PereRang1995'; type = 'Article'; bib = [ ... 
'author = {G. P\''{e}rez-Higareda and A. Rangel-Rangel and G. Chiszar and H. M. Smith}, ' ... 
'year = {1995}, ' ...
'title = {Growth of {M}orelet''s crocodile (\emph{Crocodylus moreletii}) during the first three years of life}, ' ...
'journal = {Zoo Biology}, ' ...
'volume = {14}, ' ...
'pages = {173--177}']; 
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Crocodylus_moreletii}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Crocodylus_moreletii/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

