function [data, auxData, metaData, txtData, weights] = mydata_Viverricula_indica

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Carnivora'; 
metaData.family     = 'Viverridae';
metaData.species    = 'Viverricula_indica'; 
metaData.species_en = 'Small Indian civet'; 

metaData.ecoCode.climate = {'Aw','Af'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iTf','0iTg'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bxM', 'xiCii', 'xiHs'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(37.4); % K, body temp
metaData.data_0     = {'tg','tx','tp','am','Wwb','Wwi','Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.0; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 12 18];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'bas.kooijman@vu.nl'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'sta@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 12 18]; 

%% set data
% zero-variate data

data.tg = 69;     units.tg = 'd';    label.tg = 'gestation time';             bibkey.tg = 'BalaSree2007';   
  temp.tg = C2K(37.4);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = '65-72';
data.tx = 4.25*30.5; units.tx = 'd';    label.tx = 'age at weaning';                 bibkey.tx = 'guess';   
  temp.tx = C2K(37.4);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = '4-4.5 mnth';
data.tp = 365;  units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(37.4);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
data.am = 22*365; units.am = 'd';    label.am = 'life span';                bibkey.am = 'ADW';   
  temp.am = C2K(37.4);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Wwb = 100;   units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = 'BalaSree2007';
  comment.Wwb = '90-110 g';
data.Wwi = 4000; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'BalaSree2007';
  comment.Wwi = '3-4 kg';

data.Ri  = 3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';  bibkey.Ri  = 'BalaSree2007';   
  temp.Ri = C2K(37.4);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '2-5 pups per litter, 1 litter per yr';

% univariate data
% time-weight
data.tW = [ ... % time (d), female body weight (g)
    0  100
   14  190
   28  275
   56  450
   70 1000
  183 3000]; % "adult size"
units.tW = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW  = C2K(37.4);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'BalaSree2007';
comment.tW = 'Last data point based on "adult size": 3-4 kg';


%% set weights for all real data
weights = setweights(data, []);
weights.tW = 3 * weights.tW;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
%data.psd.k = 0.3; weights.psd.k = 0.3; label.psd.k = 'maintenance ratio'; units.psd.k = '-';

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Males are slightly larger than females';
D2 = 'Typical body temperature is guessed';
metaData.discussion = struct('D1',D1, 'D2',D2);

%% Links
metaData.links.id_CoL = '5BMZX'; % Cat of Life
metaData.links.id_ITIS = '728007'; % ITIS
metaData.links.id_EoL = '1053877'; % Ency of Life
metaData.links.id_Wiki = 'Viverricula_indica'; % Wikipedia
metaData.links.id_ADW = 'Viverricula_indica'; % ADW
metaData.links.id_Taxo = '66892'; % Taxonomicon
metaData.links.id_MSW3 = '14000430'; % Mammal Spec World
metaData.links.id_AnAge = 'Viverricula_indica'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{https://en.wikipedia.org/wiki/Viverricula_indica}}';
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
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{https://animaldiversity.org/accounts/Nandinia_binotata/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Viverricula_indica/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'BalaSree2007'; type = 'Article'; bib = [ ...  
'author = {M. Balakrishnan and M. B. Sreedevi}, ' ...
'year = {2007}, ' ...
'title  = {Captive breeding of the Small {I}ndian Civet \emph{Viverricula indica} (\''{E}. {G}eoffroy {S}aint-{H}ilaire, 1803)}, ' ...
'journal = {Small Carnivore Conservation}, ' ...
'pages = {5–8}, ' ...
'volume = {36}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

