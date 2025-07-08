function [data, auxData, metaData, txtData, weights] = mydata_Rhinolophus_cornutus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Mammalia'; 
metaData.order      = 'Chiroptera'; 
metaData.family     = 'Rhinolophidae';
metaData.species    = 'Rhinolophus_cornutus'; 
metaData.species_en = 'Little Japanese horseshoe bat'; 
metaData.ecoCode.climate = {'Cfa', 'Dfa'};
metaData.ecoCode.ecozone = {'THp'};
metaData.ecoCode.habitat = {'0iTh', '0iTf', '0iTi'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {'TT'};
metaData.ecoCode.food    = {'bxM', 'xiCii'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};
metaData.T_typical  = C2K(34.8); % K, body temp
metaData.data_0     = {'tg'; 'ax'; 'ap'; 'am'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011


metaData.author      = {'Bas Kooijman'};    
metaData.date_subm   = [2018 11 06];              
metaData.email       = {'bas.kooijman@vu.nl'};            
metaData.address     = {'VU University Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2018 11 06]; 

%% set data
% zero-variate data

data.tg = 67;    units.tg = 'd';    label.tg = 'gestation time';                bibkey.tg = 'AnAge';   
  temp.tg = C2K(34.8);  units.temp.tg = 'K'; label.temp.tg = 'temperature';
  comment.tg = 'value for Rhinolophus_hipposideros';
data.tx = 35;    units.tx = 'd';    label.tx = 'time since birth at weaning';   bibkey.tx = 'AnAge';   
  temp.tx = C2K(34.8);  units.temp.tx = 'K'; label.temp.tx = 'temperature';
  comment.tx = 'Rhinolophus_hipposideros';
data.tp = 500;    units.tp = 'd';    label.tp = 'time since birth at first litter female';  bibkey.tp = 'AnAge';
  temp.tp = C2K(34.8);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'Rhinolophus_hipposideros';
data.tpm = 471;    units.tpm = 'd';    label.tpm = 'time since birth at first litter male';  bibkey.tpm = 'AnAge';
  temp.tpm = C2K(34.8);  units.temp.tpm = 'K'; label.temp.tpm = 'temperature';
  comment.tpm = 'Rhinolophus_hipposideros';
data.am = 30*365;    units.am = 'd';    label.am = 'life span';                bibkey.am = 'AnAge';   
  temp.am = C2K(34.8);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'based on other Rhinolophus species in AnAge';

data.Wwb = 1.9; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';          bibkey.Wwb = 'YokoOhts1979';
  comment.Wwb = 'based on extrapolation of tW data';
data.Wwi = 7.5;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';           bibkey.Wwi = 'YokoOhts1979';

data.Ri  = 1/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';        bibkey.Ri  = 'YokoOhts1979';   
  temp.Ri = C2K(34.8);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1 pup per litter; 1 litter per yr';

% uni-variate data
% t-W data
data.tW = [ ... % time since birth (d), weight (g)
5.232	2.375
11.594	3.981
18.216	4.963
26.048	5.647
45	    7.060];
units.tW   = {'d', 'g'};  label.tW = {'time since birth', 'wet weight'};  
temp.tW    = C2K(34.8);  units.temp.tW = 'K'; label.temp.tW = 'temperature';
bibkey.tW = 'YokoOhts1979';
    
%% set weights for all real data
weights = setweights(data, []);
weights.tW = 10 * weights.tW;

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
D1 = 'Body temperature is guessed';
D2 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '4S96T'; % Cat of Life
metaData.links.id_ITIS = '631422'; % ITIS
metaData.links.id_EoL = '328763'; % Ency of Life
metaData.links.id_Wiki = 'Rhinolophus_cornutus'; % Wikipedia
metaData.links.id_ADW = 'Rhinolophus_cornutus'; % ADW
metaData.links.id_Taxo = '64111'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_MSW3 = '13800506'; % MSW3
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Rhinolophus_cornutus}}';
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
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Rhinolophus_hipposideros}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'YokoOhts1979'; type = 'Article'; bib = [ ... 
'author = {K. Yokoyama and R Ohtsu and T. A. Uchida} , ' ... 
'year = {1979}, ' ...
'title = {Growth and {L}{D}{H} isozyme patterns in the pectoral and cardiac muscles of the {J}apanese Lesser horseshoe bat, \emph{Rhinolophus cornutus cornutus} from the standpoint of adaptation for fight}, ' ...
'journal = {J. Zool., Lond.}, ' ...
'volume = {187}, ' ...
'number = {5}, '...
'pages = {85-96}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

