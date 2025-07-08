function [data, auxData, metaData, txtData, weights] = mydata_Caiman_crocodilus

%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Crocodilia'; 
metaData.family     = 'Alligatoridae';
metaData.species    = 'Caiman_crocodilus'; 
metaData.species_en = 'Spectacled caiman'; 

metaData.ecoCode.climate = {'A'};
metaData.ecoCode.ecozone = {'TN'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFm', 'biFr'};
metaData.ecoCode.embryo  = {'Tl'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCvr', 'biCvf'};
metaData.ecoCode.gender  = {'Dtfm'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(22); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2016 11 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2017 11 12];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'}; 

metaData.author_mod_2   = {'Bas Kooijman'};    
metaData.date_mod_2     = [2023 04 09];              
metaData.email_mod_2    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_2  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 61.5;      units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'MiraMora2002';   
  temp.ab = C2K(30); units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.ap = 5*365;     units.ap = 'd';    label.ap = 'age at puberty for female';  bibkey.ap = 'Wiki';
  temp.ap = C2K(23); units.temp.ap = 'K'; label.temp.ap = 'temperature';
  comment.ap = '4-7 yrs';
data.am = 90*365;    units.am = 'd';    label.am = 'life span';               bibkey.am = 'AnAge';   
  temp.am = C2K(23); units.temp.am = 'K'; label.temp.am = 'temperature'; 
  comment.am = 'AnAge give 24.1 yr';
  
data.Lb  = 13;       units.Lb  = 'cm';  label.Lb  = 'SVL at birth';           bibkey.Lb  = 'CampMour2014';  
data.Lp  = 120;      units.Lp  = 'cm';  label.Lp  = 'total length at puberty for female'; bibkey.Lp  = 'ADW'; 
data.Lpm = 140;      units.Lpm  = 'cm'; label.Lpm  = 'total length at puberty for male';  bibkey.Lpm  = 'ADW';
data.Li  = 161;      units.Li  = 'cm';  label.Li  = 'ultimate total length for female';   bibkey.Li  = 'Wiki';
data.Lim = 250;      units.Lim  = 'cm'; label.Lim  = 'ultimate total length for male';    bibkey.Lim  = 'Wiki';

data.Ww0 = 61;       units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';     bibkey.Ww0 = {'CampMagn2008','MiraMora2002'};
  comment.Ww0 = 'Volume converted to weight using 1 g/cm^3';
data.Wwi = 20e3;     units.Wwi = 'g';   label.Wwi = 'ultimate wet weight of female'; bibkey.Wwi = 'Wiki';
data.Wwim = 58e3;    units.Wwim = 'g';  label.Wwim = 'ultimate wet weight of male';  bibkey.Wwim = 'Wiki';

data.Ri  = 40/365;   units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';    bibkey.Ri  = 'Wiki';   
  temp.Ri = C2K(23); units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
 
% uni-variate data

% time-length
data.tL_f = [ ... % time since birth (yr), SVL (cm)
0.137	14.768
0.138	13.965
0.138	13.484
0.138	12.842
0.138	12.200
0.139	11.558
1.524	30.506
2.580	33.080
2.767	44.959
2.772	34.044
9.578	77.098
10.013	72.766
12.654	80.004
15.777	84.996
16.738	84.520
16.883	82.915
17.890	88.539
21.787	82.942
22.894	79.898
23.807	81.989
24.815	84.563];
data.tL_f(:,1) = data.tL_f(:,1) * 365; % convert yr to d
units.tL_f   = {'d', 'cm'};  label.tL_f = {'time since birth', 'SVL', 'female'};  
temp.tL_f = C2K(29);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = {'CampMour2014'};
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr), SVL (cm)
0.048	12.500
0.048	13.077
0.096	12.500
1.394	31.346
1.587	33.654
1.683	32.308
1.827	31.538
2.212	39.231
2.308	37.885
2.548	42.115
2.692	31.731
2.788	36.346
3.173	34.615
3.269	36.923
5.288	71.346
8.029	79.615
8.173	82.692
8.846	90.385
20.000	96.923
20.433	105.769
20.481	111.538
21.346	106.154
23.558	103.462];
data.tL_m(:,1) = data.tL_m(:,1) * 365; % convert yr to d
units.tL_m   = {'d', 'cm'};  label.tL_m = {'time since birth', 'SVL', 'male'};  
temp.tL_m = C2K(29);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = {'CampMour2014'};
comment.tL_m = 'Data for males';
  
%% set weights for all real data
weights = setweights(data, []);
weights.Lb = 10 * weights.Lb;

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

%% Group plots
set1 = {'tL_f','tL_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
D3 = 'mod_2: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Facts
F1 = 'temperature effects sex of neonate: below  31 C neonates are male, above 32 C they are female';
metaData.bibkey.F1 = 'Wiki'; 
metaData.facts = struct('F1',F1);

%% Links
metaData.links.id_CoL = 'PBBP'; % Cat of Life
metaData.links.id_ITIS = '174370'; % ITIS
metaData.links.id_EoL = '454113'; % Ency of Life
metaData.links.id_Wiki = 'Caiman_crocodilus'; % Wikipedia
metaData.links.id_ADW = 'Caiman_crocodilus'; % ADW
metaData.links.id_Taxo = '50619'; % Taxonomicon
metaData.links.id_WoRMS = '1417014'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Caiman&species=crocodilus'; % ReptileDB
metaData.links.id_AnAge = 'Caiman_crocodilus'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Caiman_crocodilus}}';
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
bibkey = 'CampMour2014'; type = 'Article'; bib = [ ... 
'author = {Z. Camposand G. Mourao and M. Coutinho and W. E. Magnusson}, ' ... 
'year = {2014}, ' ...
'title = {Growth of \emph{Caiman  crocodilus  yacare} in the {B}razilian {P}antanal}, ' ...
'journal = {Plos One}, ' ...
'volume = {9(2)}, ' ...
'pages = {e89363.}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'CampMagn2008'; type = 'Article'; bib = [ ... 
'author = {Z. Campos and W. E. Magnusson and T. Sanaiotti and M. Coutinho}, ' ... 
'year = {2008}, ' ...
'title = {Reproductive trade-offs in \emph{Caiman crocodilus crocodilus} and \emph{Caiman crocodilus yacare}: implications for size-related management quotas}, ' ...
'journal = {HERPETOLOGICAL JOURNAL}, ' ...
'volume = {18}, ' ...
'pages = {91--96}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'MiraMora2002'; type = 'Article'; bib = [ ... 
'author = {M. P. Miranda and G. V. de Moraes and E. N. Martins and L. C. P. Maia and O. R. Barbosa}, ' ... 
'year = {2002}, ' ...
'title = {Thermic Variation in Incubation and Development of {P}antanal Caiman (\emph{Caiman crocodilus yacare}) ({D}audin, 1802) Kept in Metabolic Box}, ' ...
'journal = {Brazilian Archives of Biology and Technology}, ' ...
'volume = {45}, ' ...
'pages = {http://dx.doi.org/10.1590/S1516-89132002000300012  }'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Caiman_crocodilus}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

bibkey = 'ADW'; type = 'Misc'; bib = ...
'howpublished = {\url{http://animaldiversity.org/accounts/Caiman_crocodilus/}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
