  function [data, auxData, metaData, txtData, weights] = mydata_Psammophylax_rhombeatus
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Lamprophiidae';
metaData.species    = 'Psammophylax_rhombeatus'; 
metaData.species_en = 'Rhombic Skaapsteker'; 

metaData.ecoCode.climate = {'BWh', 'BWk', 'Csa'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'biTi', 'biTs'};
metaData.ecoCode.embryo  = {'Tnsf'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26.5); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wwi'; 'Ri'};  
metaData.data_1     = {'t-Le'}; 

metaData.COMPLETE = 2.3; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2019 06 26];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2019 06 26]; 

%% set data
% zero-variate data
data.ab = 42;         units.ab = 'd';  label.ab = 'age at birth';          bibkey.ab = 'EoL';
  temp.ab = C2K(30); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 6*365;        units.am = 'd';  label.am = 'maximum life span';        bibkey.am = 'AnAge';
  temp.am = C2K(30); units.temp.am = 'K'; label.temp.am = 'temperature';
  comment.am = 'value for Psammophis subtaeniatus';
  
data.Lb = 19;      units.Lb = 'cm';     label.Lb = 'total length at birth';  bibkey.Lb = 'Bour1970';
data.Lp = 70;     units.Lp = 'cm';     label.Lp = 'total length at puberty'; bibkey.Lp = 'guess';
  comment.Lp = 'based on typical length between 45 and 85 cm (EoL)';
data.Li = 140;     units.Li = 'cm';     label.Li = 'ultimate total length';  bibkey.Li = 'EoL';

data.Ww0 = 2.94;      units.Ww0 = 'g';     label.Ww0 = 'initial egg weight';  bibkey.Ww0 = 'EoL';
  comment.Ww0 = 'based on egg length of 27 mm, width 15 mm: pi/6*2.5*1.5^2';
data.Wwi = 1.9e3;   units.Wwi = 'g';     label.Wwi = 'ultimate weight';  bibkey.Wwi = 'guess';
  comment.Wwi = 'based Psammophis_sibilans; similar in length, but P.rhombeatus is more sender';


data.Ri = 2*30/365;  units.Ri = '#/d';  label.Ri = 'max reprod rate';  bibkey.Ri = 'EoL';   
  temp.Ri = C2K(30); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '30 eggs per clutch, assumed: 2 clutches per yr';
  
% univariate data
data.tLe = [ ... % time (d), total length (cm)
    0  8.5
    3  9.35
    7  9.1
   13  10.65
   22  16.6
   31  19.2
   40  19.3];
data.tLe(:,1) = data.tLe(:,1) + 3; % set time at guessed origin 
units.tLe  = {'d', 'cm'};  label.tLe = {'age', 'embryo total length'};  
temp.tLe   = C2K(30);  units.temp.tLe = 'K'; label.temp.tLe = 'temperature';
bibkey.tLe = 'Bour1970';

%% set weights for all real data
weights = setweights(data, []);
weights.tLe = 3 * weights.tLe;
weights.Li = 3 * weights.Li;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;
                  
%% Discussion points
D1 = 'Males are assumed not to differ from females';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'neonate of SVL 152 mm has TL 193 mm, so SVL = TL * 0.79';
metaData.bibkey.F1 = 'Bour1970'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '4NCZF'; % Cat of Life
metaData.links.id_ITIS = '1082253'; % ITIS
metaData.links.id_EoL = '1055560'; % Ency of Life
metaData.links.id_Wiki = 'Psammophylax_rhombeatus'; % Wikipedia
metaData.links.id_ADW = 'Psammophylax_rhombeatus'; % ADW
metaData.links.id_Taxo = '644983'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Psammophylax&species=rhombeatus'; % ReptileDB
metaData.links.id_AnAge = ''; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Psammophylax_rhombeatus}}';
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
bibkey = 'Bour1970'; type = 'Article'; bib = [ ... 
'doi = {10.1080/04416651.1970.9650762}, ' ...
'author = {O. Bourquin}, ' ...
'year = {1970}, ' ...
'title = {A NOTE ON THE GROWTH OF SPOTTED SKAAPSTEKER EMBRYOS (\emph{Psammophylax rhombeatus})}, ' ... 
'journal = {The Journal of the Herpetological Association of Africa}, ' ...
'volume = {6(1)}, '...
'pages = {8-9}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';']; 
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/1055560/articles}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{https://genomics.senescence.info/species/entry.php?species=Psammophis_subtaeniatus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

