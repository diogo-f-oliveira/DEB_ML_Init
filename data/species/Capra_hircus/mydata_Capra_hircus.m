function [data, auxData, metaData, txtData, weights] = mydata_Capra_hircus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Cetartiodactyla'; 
metaData.family     = 'Bovidae';
metaData.species    = 'Capra_hircus'; 
metaData.species_en = 'Goat'; 

metaData.ecoCode.climate = {'A', 'B', 'C'};
metaData.ecoCode.ecozone = {'T'};
metaData.ecoCode.habitat = {'0iTi', '0iTs', '0iTg', '0iTa'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiHl'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(39.3); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am';'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2021 10 29];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 10 29]; 

%% set data
% zero-variate data

data.tg = 155;    units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg =  'AnAge';   
  temp.tg = C2K(39.3);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
data.tx = 160;    units.tx = 'd';    label.tx = 'time since birth at weaning'; bibkey.tx = 'AnAge';   
  temp.tx = C2K(39.3);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
data.tp = 406;    units.tp = 'd';    label.tp = 'time since birth at puberty of females'; bibkey.tp = 'AnAge';
  temp.tp = C2K(39.3);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.tpm = 685;    units.tpm = 'd';    label.tpm = 'time since birth at puberty of males'; bibkey.tpm = 'AnAge';
  temp.tpm = C2K(39.3);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
data.am = 20.8*365;    units.am = 'd';    label.am = 'life span';              bibkey.am = 'AnAge';   
  temp.am = C2K(39.3);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 2250;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';       bibkey.Wwb = 'AnAge';
data.Wwi = 61e3;   units.Wwi = 'g';   label.Wwi = 'ultimate wet weight females'; bibkey.Wwi = 'Wiki';
  
data.Ri  = 1.5/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'AnAge';   
  temp.Ri = C2K(39.3);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';

% time-weight data
data.tW = [ % time since birth (yr), body weight (g)
    0  3140
   30  6710
   60 11000
   90 14600
  180 24500
  270 29900
  365 35300
  545 44900
  730 53700
 1095 58400
 1460 60300]; 
units.tW  = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW = C2K(39.3);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = {'ZullRick1984','AltmDitt1969'};

%% set weights for all real data
weights = setweights(data, []);
weights.tW = 5 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.v = 5 * weights.psd.v;
data.psd.k = 0.3; units.psd.k = '-'; label.psd.k = 'maintenance ratio';
weights.psd.k = 5 * weights.psd.k_J; weights.psd.k_J = 0;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
%txtData.comment = comment;


%% Discussion points
D1 = 'Slow/fast parameter for foetal development point to rather slow development';
D2 = 'Males are assumend to differ from females by E_Hp only';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = 'QS68'; % Cat of Life
metaData.links.id_ITIS = '180715'; % ITIS
metaData.links.id_EoL = '328660'; % Ency of Life
metaData.links.id_Wiki = 'Capra_hircus'; % Wikipedia
metaData.links.id_ADW = 'Capra_hircus'; % ADW
metaData.links.id_Taxo = '68567'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '14200776'; % MSW3
metaData.links.id_AnAge = 'Capra_hircus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Capra_hircus}}';
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
bibkey = 'ZullRick1984'; type = 'Article'; bib = [ ... 
'author = {E. M. Zullinger and R. E. Ricklefs and K. H. Redford and G. M. Mace}, ' ... 
'year = {1984}, ' ...
'title = {Fitting Sigmoidal Equations to Mammalian Growth Curves}, ' ...
'journal = {Journal of Mammalogy}, ' ...
'volume = {65}, ' ...
'number = {4}, ' ...
'pages = {607--636}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Capra_hircus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Capra_hircus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AltmDitt1969'; type = 'Book'; bib = [ ...  
'author = {Altman, P. L. and Dittmer, D. S.}, ' ...
'year = {1969}, ' ...
'title  = {Biological Data Book}, ' ...
'seroes = {Biological Handbooks}, ' ...
'publisher = {Federation of American Societies of Experimental Biology}, ' ...
'address = {Bethesda, Maryland}, ' ...
'pages = {606pp}, ' ...
'howpublished = {\url{../../../bib/Kooy2010.html}}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

