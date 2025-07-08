function [data, auxData, metaData, txtData, weights] = mydata_Kinosternon_subrubrum
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Kinosternidae';
metaData.species    = 'Kinosternon_subrubrum'; 
metaData.species_en = 'Eastern mud turtle'; 

metaData.ecoCode.climate = {'Cfa','Dfa'};
metaData.ecoCode.ecozone = {'THn'};
metaData.ecoCode.habitat = {'0bTd', 'biFp'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biCi', 'biHl'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(21); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Li'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-L'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 04 29];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.author_mod_1   = {'Bas Kooijman'};    
metaData.date_mod_1     = [2023 04 09];              
metaData.email_mod_1    = {'bas.kooijman@vu.nl'};            
metaData.address_mod_1  = {'VU University, Amsterdam'};   

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@tecnico.ulisboa.pt'}; 
metaData.date_acc    = [2023 04 09];

%% set data
% zero-variate data

data.ab = 106;     units.ab = 'd';    label.ab = 'age at birth';                     bibkey.ab = 'Iver1979';   
  temp.ab = C2K(30.5);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 6.3*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'Iver1979';   
  temp.tp = C2K(21);  units.temp.tp = 'K'; label.temp.tp = 'temperature'; 
data.am = 40*365;     units.am = 'd';    label.am = 'life span';                    bibkey.am = 'AnAge';   
  temp.am = C2K(21);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb  = 1.84;   units.Lb   = 'cm';  label.Lb  = 'plastron length at birth';         bibkey.Lb  = 'Iver1979'; 
data.Lp  = 7.75; units.Lp  = 'cm';  label.Lp  = 'plastron length fat puberty'; bibkey.Lp  = 'Iver1979';
data.Li  = 10.2;   units.Li  = 'cm';  label.Li  = 'ultimate plastron length for females'; bibkey.Li  = 'Wiki';
data.Lim  = 9;   units.Lim  = 'cm';  label.Lim  = 'ultimate plastron length for males'; bibkey.Lim  = {'Wiki','Iver1979'};
  comment.Lim = 'based on tL_m(8yr)/tL_f(8yr)*Li: 10.2*7.28/8.22';

data.Wwi = 209; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight for females';   bibkey.Wwi = 'guess';
  comment.Wwi = 'based in same length-weight compared to K.scorpiodes: 225* 10.2/11';

data.Ri  = 3*3/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';             bibkey.Ri  = 'Iver1979';   
  temp.Ri = C2K(21);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-6 (mode 6) eggs per clutch, 3 clutch per yr';
 
% uni-variate data
% time-length
data.tL_f = [ ... % time since birth (yr in winters), plastron length (cm)
    1 1.67
    2 3.88
    3 4.59
    4 5.51
    5 6.32
    6 7.16
    7 7.71
    8 8.22];
data.tL_f(:,1) = (data.tL_f(:,1) - 0.75) * 365; % convert yr to d
units.tL_f  = {'d', 'cm'};  label.tL_f = {'time since birth', 'plastron length', 'female'};  
temp.tL_f   = C2K(21);  units.temp.tL_f = 'K'; label.temp.tL_f = 'temperature';
bibkey.tL_f = 'Iver1979';
comment.tL_f = 'Data for females';
% 
data.tL_m = [ ... % time since birth (yr in winters), plastron length (cm)
    1 1.61
    2 3.48
    3 4.72
    4 5.69
    5 6.31
    6 6.74
    7 7.28];
data.tL_m(:,1) = (data.tL_m(:,1) - 0.75) * 365; % convert yr to d
units.tL_m  = {'d', 'cm'};  label.tL_m = {'time since birth', 'plastron length', 'male'};  
temp.tL_m   = C2K(21);  units.temp.tL_m = 'K'; label.temp.tL_m = 'temperature';
bibkey.tL_m = 'Iver1979';
comment.tL_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tL_f = 10 * weights.tL_f;
weights.tL_m = 10 * weights.tL_m;
weights.Li = 3 * weights.Li;
weights.Lim = 3 * weights.Lim;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);

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
D2 = 'Temperatures are guessed';
D3 = 'mod_1: males have equal state variables at b, compared to females';
metaData.discussion = struct('D1',D1, 'D2',D2, 'D3',D3);  

%% Links
metaData.links.id_CoL = '3R875'; % Cat of Life
metaData.links.id_ITIS = '173763'; % ITIS
metaData.links.id_EoL = '791770'; % Ency of Life
metaData.links.id_Wiki = 'Kinosternon_subrubrum'; % Wikipedia
metaData.links.id_ADW = 'Kinosternon_subrubrum'; % ADW
metaData.links.id_Taxo = '48371'; % Taxonomicon
metaData.links.id_WoRMS = '1498274'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Kinosternon&species=subrubrum'; % ReptileDB
metaData.links.id_AnAge = 'Kinosternon_subrubrum'; % AnAge

%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Kinosternon_subrubrum}}';
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
bibkey = 'Iver1979'; type = 'Article'; bib = [ ... 
'author = {John B. Iverson}, ' ... 
'year = {1979}, ' ...
'title = {Reproduction and Growth of the Mud Turtle, \emph{Kinosteron subrubrum} ({R}eptilia, {T}estudines, {K}inosternidae), in {A}rkansas}, ' ...
'journal = {Journal of Herpetology}, ' ...
'volume = {13(1)}, ' ...
'pages = {105-111}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Kinosternon_subrubrum}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/791770}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

