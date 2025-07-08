function [data, auxData, metaData, txtData, weights] = mydata_Typhlonectes_natans

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Amphibia'; 
metaData.order      = 'Gymnophiona'; 
metaData.family     = 'Typhlonectidae';
metaData.species    = 'Typhlonectes_natans'; 
metaData.species_en = 'Rubber eel'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr', '0iFc'};
metaData.ecoCode.embryo  = {'Fv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'bjTva', 'jiCi', 'jiSvf'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'aj'; 'ap'; 'am'; 'Lb'; 'Lj'; 'Lp'; 'Li'; 'Ww_L'; 'Wwj'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2023 02 14];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 02 14];

%% set data
% zero-variate data

data.aj = 220;  units.aj = 'd';    label.aj = 'age at metam';                 bibkey.aj = 'Wiki';   
  temp.aj = C2K(27);  units.temp.aj = 'K'; label.temp.aj = 'temperature'; 
data.tp = 16*30.5;  units.tp = 'd';    label.tp = 'time since metam at puberty'; bibkey.tp = 'guess';   
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
  comment.tp = 'based on Typhlonectes_compressicauda';
data.am = 10*365;  units.am = 'd';    label.am = 'life span';                 bibkey.am = 'guess';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'AnAge gives 4.1 yr, but this seems short given ap=2yr and 2yr reproduction cycle';

data.Lb  = 1.7;      units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'guess';  
  comment.Lb = 'based on Typhlonectes_compressicauda 15 to 20 mm hatch from egg membrane for Dermophis mexicanus';
data.Lj  = 13.68;     units.Lj  = 'cm';  label.Lj  = 'total length at metam';    bibkey.Lj  = 'guess';  
  comment.Lj = 'coincides with leaving the mother';
data.Lp  = 30;     units.Lp  = 'cm';  label.Lp  = 'total length at puberty for females';  bibkey.Lp  = 'guess';
  comment.Lp = 'based on Typhlonectes_compressicauda';
data.Lpm  = 28;     units.Lpm  = 'cm';  label.Lpm  = 'total length at puberty for males';  bibkey.Lpm  = 'guess';
data.Li  = 55;    units.Li = 'cm'; label.Li = 'ultimate total length'; bibkey.Li  = 'Wiki';

data.Wwj = 6;     units.Wwj = 'g';   label.Wwj = 'wet weight at metam';      bibkey.Wwj = 'guess';
data.Wwp = 34.6;     units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';    bibkey.Wwp = 'guess';
  comment.Wwp = 'based on Wwi*(L_p/L_i)^3';
data.Wwi = 213;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';      bibkey.Wwi = 'guess';
  comment.Wwi = 'based on Typhlonectes_compressicauda';

data.Ri  = 14/365/2;    units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';   bibkey.Ri  = 'guess';   
  temp.Ri = C2K(27);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'based on Typhlonectes_compressicauda: 6 to 14 eggs per clutch, 1 clutch each other yr, but typically 4 young leave mother';

% uni-variate data
% time-length
data.tL = [ ... LAG(#), total length (cm)
    0 15.4
    2 29.8
    2 33.2
    4 42.1
    7 49.6];
data.tL(:,1) = (data.tL(:,1)+0.5) * 365; % convert LAG to d
units.tL  = {'d', 'cm'}; label.tL = {'time since birth', 'total length'};  
temp.tL   = C2K(27); units.temp.tL = 'K'; label.temp.tL = 'temperature';
bibkey.tL = 'MeasWilk1998';

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
D1 = 'Males are assumed to differ from females by E_Hp only';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Ovoviviparous, young feed on maternal glandular secretions, scraping the inside of the oviduct';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'Two vesiculous gills are present at the back of the dorsum of the head at birth; these fall off 24-48 h after birth and leave-a white scar that fades after some weeks';
metaData.bibkey.F2 = 'ExbrDels1985'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '59WWK'; % Cat of Life
metaData.links.id_ITIS = '1100581'; % ITIS
metaData.links.id_EoL = '333734'; % Ency of Life
metaData.links.id_Wiki = 'Typhlonectes_natans'; % Wikipedia
metaData.links.id_ADW = 'Typhlonectes_natans'; % ADW
metaData.links.id_Taxo = '137595'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_amphweb = 'Typhlonectes+natans'; % AmphibiaWeb
metaData.links.id_AnAge = 'Typhlonectes_natans'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Typhlonectes_natans}}';
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
bibkey = 'ExbrDels1985'; type = 'Article'; bib = [ ...
'author = {Jean-Marie Exbrayat and Michel Delsol}, ' ... 
'year = {1985}, ' ...
'title = {Reproduction and Growth of \emph{Typhlonectes compressicaudus} - a viviparous {G}ymnophione}, ' ...
'journal = {Copeia}, ' ...
'volume = {1985}, ' ...
'pages = {91-95}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Typhlonectes_natans}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MeasWilk1998'; type = 'Article'; bib = [ ...
'author = {G. John Measey and Mark Wilkinson}, ' ... 
'year = {1998}, ' ...
'title = {Lines of arrested growth in the caecilian, \emph{Typhlonectes natans} ({A}mphibia: {G}ymnophiona)}, ' ...
'journal = {Amphibia-Reptilia}, ' ...
'volume = {19}, ' ...
'pages = {244-256}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'amphibiaweb'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Typhlonectes+natans}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

