function [data, auxData, metaData, txtData, weights] = mydata_Oikopleura_dioica

%% set metadata
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Appendicularia'; 
metaData.order      = 'Copelata'; 
metaData.family     = 'Oikopleuridae';
metaData.species    = 'Oikopleura_dioica'; 
metaData.species_en = 'Sea-squirt'; 

metaData.ecoCode.climate = {'MC'};
metaData.ecoCode.ecozone = {'MC'};
metaData.ecoCode.habitat = {'0iMp'};
metaData.ecoCode.embryo  = {'Mp'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biPn'};
metaData.ecoCode.gender  = {'D'};
metaData.ecoCode.reprod  = {'Os'};

metaData.T_typical  = C2K(15); % K, body temperature
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'L_t'; 'Wdb'; 'Wd_t'; 'Ni'};  % tags for different types of zero-variate data
metaData.data_1     = {'t-L'}; % tags for different types of uni-variate data

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Maxime Vaugeois'};                             
metaData.date_subm = [2011 03 15];                          
metaData.email    = {'maxime.vaugeois@univmed.fr'};                 
metaData.address  = {'LOPB (UMR 6535) - COM (OSU) - Universite Aix-Marseille II'};      

metaData.author_mod_1  = {'Bas Kooijman'};          
metaData.date_mod_1    = [2011 05 25];                  
metaData.email_mod_1   = {'bas.kooijman@vu.nl'};        
metaData.address_mod_1 = {'VU University Amsterdam, 1081 HV, Netherlands'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight.augustine@akvaplan.niva.no'}; 
metaData.date_acc    = [2015 12 27]; 

%% set data
% zero-variate data;
data.ab = 0.33;units.ab = 'd';    label.ab = 'age at birth';   bibkey.ab = {'Fena1998'};    
  temp.ab = C2K(22); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.am = 8; units.am = 'd';    label.am = 'life span';      bibkey.am = {'Fena1998'};   
  temp.am = C2K(15); units.temp.am = 'K'; label.temp.am = 'temperature';

data.Lb = 0.0115; units.Lb = 'cm';    label.Lb = 'total trunc length at birth';   bibkey.Lb = {'LombScia2009'};    
data.L8 = 0.1226; units.L8 = 'cm';    label.L8 = 'total trunc length at 8 d';     bibkey.L8 = {'LombScia2009'};   
  temp.L8 = C2K(22); units.temp.L8 = 'K'; label.temp.L8 = 'temperature';
data.Wdb = 0.4; units.Wdb = 'mug';    label.Wdb = 'dry weight at birth';   bibkey.Wdb = {'LombScia2009'};    
data.Wd8 = 52.6; units.Wd8 = 'mug';    label.Wd8 = 'dry weight at 8 d';    bibkey.Wd8 = {'LombScia2009'};   
  temp.Wd8 = C2K(22); units.temp.Wd8 = 'K'; label.temp.Wd8 = 'temperature';

% reproduction (copy from mydata_Oikopleura_dioica)
data.NR  = 164.63; units.NR  = '#';label.NR  = 'total number of eggs at death';  bibkey.NR  = 'LombScia2009';   
  temp.NR = C2K(15); units.temp.NR = 'K'; label.temp.NR = 'temperature';

% uni-variate data at f; total trunc length includes gonads
data.tL = [ 1        2        3       4       5       6       7       8;    % d, time since birth
        0.01997  0.02244  0.03083 0.04217 0.05063 0.07054 0.10165 0.12271]'; % mm, physical length at f and T
units.tL = {'d', 'cm'};     label.tL = {'time since birth', 'total trunc length'};  bibkey.tL = 'LombScia2009';
  temp.tL = C2K(15);  units.temp.tL = 'K'; label.temp.tL = 'temperature';

%% set weights for all real data
weights = setweights(data, []);

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

%% pack data and txt_data for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;

%% Discussion
D1 = 'Reprod buffer builds up on trunk, so the basis growth with L^2, and contribution to total trunc length with N/L^2';
D2 = 'Allocation to reproduction starts at birth, so E_Hp = E_Hb';
D3 = 'Parameters tuned by hand';
metaData.discussion = struct('D1',D1,'D2',D2,'D3',D3);

%% Facts
F1 = 'Produces a new house each 2 h (marine snow)';
metaData.bibkey.F1 = 'Wiki'; 
F2 = 'dies at first spawning';
metaData.bibkey.F2 = 'Wiki'; 
metaData.facts = struct('F1',F1,'F2',F2);

%% Links
metaData.links.id_CoL = '48ZX5'; % Cat of Life
metaData.links.id_ITIS = '159669'; % ITIS
metaData.links.id_EoL = '512477'; % Ency of Life
metaData.links.id_Wiki = 'Oikopleura_dioica'; % Wikipedia
metaData.links.id_ADW = 'Oikopleura_dioica'; % ADW
metaData.links.id_Taxo = '114881'; % Taxonomicon
metaData.links.id_WoRMS = '103407'; % WoRMS

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Oikopleura_dioica}}';   
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
bibkey = 'Fena1998'; type = 'Incollection'; bib = [ ... 
'author = {Fenaux, R.}, ' ...
'year = {1998}, ' ...
'title  = {The classification of {A}ppendicularia.}, ' ...
'booktitle = {The biology of pelagic tunicates}, ' ...
'editor = {Bone, Q.}, ' ...
'publisher = {Oxford University Press}, ' ...
'pages = {295--306}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'LombScia2009'; type = 'Article'; bib = [ ... 
'author = {Lombard, F. and Sciandra, A. and Gorsky, G.}, ' ...
'year = {2009}, ' ...
'title  = {Appendicularians ecophysiology. II. {R}eproducing clearance, growth, respiration and particles production of the appendicularian \emph{Oikopleura dioica} by modeling its ecophysiology}, ' ...
'journal = {Journal of Marine Systems}, ' ...
'volume = {78}, ' ...
'pages = {617--629}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

