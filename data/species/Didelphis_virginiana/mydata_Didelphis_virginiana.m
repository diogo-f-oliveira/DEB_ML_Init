function [data, auxData, metaData, txtData, weights] = mydata_Didelphis_virginiana

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Didelphimorphia'; 
metaData.family     = 'Didelphidae';
metaData.species    = 'Didelphis_virginiana'; 
metaData.species_en = 'Virginia opossum'; 

metaData.ecoCode.climate = {'A', 'Cfa', 'Csb', 'Dfa', 'Dfb'};
metaData.ecoCode.ecozone = {'THp', 'TN'};
metaData.ecoCode.habitat = {'0iTf', '0iTh'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCi', 'xiCv', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(35); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Li'; 'Wwb'; 'Wwx'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2012 09 04];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University Amsterdam'};   

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2016 11 14];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2016 11 14]; 


%% set data
% zero-variate data

data.tg = 12.5;    units.tg = 'd';    label.tg = 'gestation time';              bibkey.tg = 'AnAge';   
  temp.tg = C2K(35);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 102;     units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(35);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 184;     units.tp = 'd';    label.tp = 'time since birth at puberty for females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(35);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.tpm = 243;    units.tpm = 'd';   label.tpm = 'time since birth at puberty for males';  bibkey.tpm = 'AnAge';
  temp.tpm = C2K(35);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 6.6*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(35);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Li  = 33;     units.Li  = 'cm';  label.Li  = 'ultimate total length';   bibkey.Li  = 'Wiki';
  comment.Li = '21.6-47 cm';

data.Wwb = 0.147;  units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'AnAge';
data.Wwx = 142.5;  units.Wwx = 'g';   label.Wwx = 'wet weight at weaning';   bibkey.Wwx = 'AnAge';
data.Wwi = 3000;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females'; bibkey.Wwi = 'AnAge';
  comment.Wwi = 'Wiki: 0.3-3.7 kg';
data.Wwim = 6000;  units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males'; bibkey.Wwim = 'AnAge';
  comment.Wwim = 'Wiki: 0.8-6.4 kg';

data.Ri  = 30/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';     bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(35); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% univariate data
% time-weight
data.tWw = [ ... % time since birth (d), weight (g)
    1   0.13
    5   0.4
   10   0.9
   15   1.3
   20   1.7
   25   2.4
   30   3.9
   35   5.4
   40   7.0
   50  13.0
   60  25.0
   70  45.0
   80  80.0
  100 125.0];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(35);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature'; 
bibkey.tWw = 'Petr1949';
  
%% set weights for all real data
weights = setweights(data, []);

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
metaData.discussion = struct('D1', D1);

%% Facts
F1 = '"They are one of the worlds most variably sized mammals"';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '35WKF'; % Cat of Life
metaData.links.id_ITIS = '179921'; % ITIS
metaData.links.id_EoL = '328501'; % Ency of Life
metaData.links.id_Wiki = 'Didelphis_virginiana'; % Wikipedia
metaData.links.id_ADW = 'Didelphis_virginiana'; % ADW
metaData.links.id_Taxo = '59824'; % Taxonomicon
metaData.links.id_WoRMS = '1484112'; % WoRMS
metaData.links.id_MSW3 = '10400045'; % MSW3
metaData.links.id_AnAge = 'Didelphis_virginiana'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Didelphis_virginiana}}';
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
bibkey = 'Hart1929'; type = 'Article'; bib = [ ... 
'author = {Hartman, C. G.}, ' ... 
'year = {1929}, ' ...
'title = {The breeding season of the opossum (\emph{Didelphis virginiana}) and the rate of intra-uterine and postnatal development}, ' ...
'journal = {J. Morph. Physiol.}, ' ...
'volume = {46}, ' ...
'number = {1}, '...
'pages = {143--211}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Petr1949'; type = 'Article'; bib = [ ... 
'author = {George A. Petrides}, ' ... 
'year = {1949}, ' ...
'title = {Sex and Age Determination in the Opossum}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {30}, ' ...
'number = {4}, '...
'pages = {364-378}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Didelphis_virginiana}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

