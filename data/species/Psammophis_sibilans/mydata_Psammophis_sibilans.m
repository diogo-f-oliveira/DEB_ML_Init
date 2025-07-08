  function [data, auxData, metaData, txtData, weights] = mydata_Psammophis_sibilans
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lamprophiidae';
metaData.species    = 'Psammophis_sibilans'; 
metaData.species_en = 'African sand snake'; 

metaData.ecoCode.climate = {'Aw', 'BWh', 'BSh', 'Csa'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biTi', 'biTs'};
metaData.ecoCode.embryo  = {'Tnt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-Le'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 23];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 23]; 

%% set data
% zero-variate data
data.ab = 50;         units.ab = 'd';  label.ab = 'age at birth';          bibkey.ab = 'KhanZahr2016';
  temp.ab = C2K(30); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'AnAge';
  temp.am = C2K(30); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'value for Psammophis subtaeniatus';
  
data.Lb = 19.05;      units.Lb = 'cm';     label.Lb = 'SVL at birth';  bibkey.Lb = 'KhanZahr2016';
data.Lp = 73.3;     units.Lp = 'cm';     label.Lp = 'SVL at puberty'; bibkey.Lp = 'guess';
  comment.Lp = 'based on Lp/Li of Boaedon_fuliginosus: 91.6*72/90';
data.Li = 91.6;     units.Li = 'cm';     label.Li = 'ultimate SVL for females';  bibkey.Li = 'Bran1992';
  comment.Li = 'based on TL of 135 cm, converted to SVL using F1';

data.Ww0 = 14.15;      units.Ww0 = 'g';     label.Ww0 = 'initial egg weight';  bibkey.Ww0 = 'KhanZahr2016';
  comment.Ww0 = 'based on egg length of 38.5 mm, width 26.5 mm: pi/6*3.85*2.65^2';
data.Wwi = 2381.51;   units.Wwi = 'g';     label.Wwi = 'ultimate weight';  bibkey.Wwi = 'EoL';

data.Ri = 30/365;  units.Ri = '#/d';  label.Ri = 'max reprod rate';  bibkey.Ri = 'Bran1992';   
  temp.Ri = C2K(30); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '4 to 15 eggs per clutch, 2 clutch per yr';
  
  
% univariate data
data.tLe = [ ... % age (d), SVL (cm)
    2  0.85
    5  1.00
    8  1.95
   14  3.00
   18  4.50
   25  6.01
   31  9.04
   37 13.0
   41 14.0
   50 19.05];
units.tLe  = {'d', 'cm'};  label.tLe = {'age', 'embryo SVL'};  
temp.tLe   = C2K(30);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'KhanZahr2016';

%% set weights for all real data
weights = setweights(data, []);
weights.tLe = 10 * weights.tLe;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                  
%% Discussion points
D1 = 'Males are assumed not to differ';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'neonate of SVL 190.5 mm has tail of 90.1 mm, so SVL = TL * 0.6787';
metaData.bibkey.F1 = 'KhanZahr2016'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4NCYF'; % Cat of Life
metaData.links.id_ITIS = '1082249'; % ITIS
metaData.links.id_EoL = '459775'; % Ency of Life
metaData.links.id_Wiki = 'Psammophis'; % Wikipedia
metaData.links.id_ADW = 'Psammophis_sibilans'; % ADW
metaData.links.id_Taxo = '644979'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Psammophis&species=sibilans'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Psammophis_sibilans}}';
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
bibkey = 'KhanZahr2016'; type = 'Article'; bib = [ ... 
'doi = {10.1111/azo.12157}, ' ...
'author = {Eraqi R. Khannoon and Oldrich Zahradnicek}, ' ...
'year = {2016}, ' ...
'title = {Postovipositional development of the sand snake \emph{Psammophis sibilans} ({S}erpentes: {L}amprophiidae) in comparison with other snake species}, ' ... 
'journal = {Acta Zoologica}, ' ...
'volume = {0}, '...
'pages = {1-10}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/459775}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Bran1992'; type = 'Book'; bib = [ ...  % used in setting of chemical parameters and pseudodata
'author = {Branch, B.}, ' ...
'year = {1992}, ' ...
'title  = {Field guide to the snakes and other reptiles of South Africa}, ' ...
'publisher = {New Holland (Publishers) Ltd}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Psammophis_subtaeniatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

