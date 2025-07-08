function [data, auxData, metaData, txtData, weights] = mydata_Eunectes_murinus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Squamata'; 
metaData.family     = 'Boidae';
metaData.species    = 'Eunectes_murinus'; 
metaData.species_en = 'Green anaconda'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0iFr'};
metaData.ecoCode.embryo  = {'Tv'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCv'};
metaData.ecoCode.gender  = {'Dg'};
metaData.ecoCode.reprod  = {'Apf'};

metaData.T_typical  = C2K(29); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'L-Ww'; 'L-N'}; 

metaData.COMPLETE = 2.6; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2011 12 12];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 11 20];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University Amsterdam'};  

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 11 20]; 


%% set data
% zero-variate data

data.ab = 195;      units.ab = 'd';    label.ab = 'age at birth';             bibkey.ab = 'Wiki';   
  temp.ab = C2K(29);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
  comment.ab = 'Wiki: 6 - 7 months; all temps are guessed';
data.ap = 3*365;     units.ap = 'd';    label.ap = 'age at puberty for female'; bibkey.ap = 'Vanaqua';
  temp.ap = C2K(29);  units.temp.ap = 'K'; label.temp.ap = 'temperature';
data.am = 30*365;     units.am = 'd';    label.am = 'life span';                 bibkey.am = 'Wiki';   
  temp.am = C2K(29);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 75;   units.Lb  = 'cm';  label.Lb  = 'total length at birth';    bibkey.Lb  = 'Wiki';
  comment.Lb = 'Wiki: 38 till 51';
data.Lp  = 302;   units.Lp  = 'cm';  label.Lp  = 'total length at puberty';  bibkey.Lp  = 'Abuy2003'; 
data.Li  = 914;   units.Li  = 'cm';  label.Li  = 'ultimate total length';    bibkey.Li  = 'Abuy2003';

data.Wwb = 333; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';        bibkey.Wwb = 'Abuy2003';
  comment.Wwb = 'Abuy2003';
data.Wwp = 15000;   units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';  bibkey.Wwp = 'Wiki';
data.Wwi = 250000;  units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';    bibkey.Wwi = 'ADW';

data.Ri  = 100/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(29);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = 'Wiki: typical 20 - 40 per clutch';
 
% uni-variate data

% Data from Abuy2003
data.LW = [ 302 330 417 445 520 580 800;    % cm, physical length
          15  23  68  70  77 107 180]';  % kg, wet weight  (including eggs)
data.LW(:,2) = data.LW(:,2) * 1e3; % convert kg to g
units.LW = {'cm', 'g'};     label.LW = {'total length', 'wet weight'};  
bibkey.LW = 'Abuy2003';
%
data.LN = [302 330 445 520 580; 18 23 70 77 72]'; % cm, # length, number of eggs
units.LN   = {'cm', '#'};  label.LN = {'total length', 'number of eggs'};  
temp.LN    = C2K(29);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Abuy2003';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 0.1;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Discussion points
D1 = 'Reproduction rate is supposed to correspond to L = 6.5 m; snakes of 9 m are very rare';   
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'a snake of 15 kg dropped to 9 kg after laying 18 young';
metaData.bibkey.F1 = 'Abuy2003'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = '6GYDR'; % Cat of Life
metaData.links.id_ITIS = '634802'; % ITIS
metaData.links.id_EoL = '794661'; % Ency of Life
metaData.links.id_Wiki = 'Eunectes_murinus'; % Wikipedia
metaData.links.id_ADW = 'Eunectes_murinus'; % ADW
metaData.links.id_Taxo = '49883'; % Taxonomicon
metaData.links.id_WoRMS = '1498250'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Eunectes&species=murinus'; % ReptileDB
metaData.links.id_AnAge = 'Eunectes_murinus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Eunectes_murinus}}';
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
bibkey = 'Abuy2003'; type = 'Book'; bib = [ ... 
'author = {Abuys, A.}, ' ... 
'year = {2003}, ' ...
'title = {De slangen van Suriname.}, ' ...
'publisher = {Gopher Publ.}, ' ...
'address = {Groningen}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'Vanaqua'; type = 'Misc'; bib = ...
'howpublished = {\url{https://www.vanaqua.org/learn/aquafacts/reptiles/anacondas}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Eunectes_murinus/#815F0F14-924A-11E1-9DCA-002500F14F28}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
