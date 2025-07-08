function [data, auxData, metaData, txtData, weights] = mydata_Heosemys_spinosa
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Geoemydidae';
metaData.species    = 'Heosemys_spinosa'; 
metaData.species_en = 'Spiny turtle'; 

metaData.ecoCode.climate = {'Aw'};
metaData.ecoCode.ecozone = {'TPi'};
metaData.ecoCode.habitat = {'0iFc', '0iTi'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(26); % K, body temp
metaData.data_0     = {'ab'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Ww0'; 'Wwb'; 'Wwi'; 'Ri'}; 
metaData.data_1     = {'t-Ww'; 'L-Ww'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2021 05 10];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2021 05 10];

%% set data
% zero-variate data

data.ab = 127;     units.ab = 'd';    label.ab = 'age at birth';                bibkey.ab = 'Goet2007';   
  temp.ab = C2K(30);  units.temp.ab = 'K'; label.temp.ab = 'temperature'; 
  comment.ab = '104-142 d at 24-28 C';
data.am = 22.9*365;     units.am = 'd';    label.am = 'life span';                bibkey.am = 'EoL';   
  temp.am = C2K(26);  units.temp.am = 'K'; label.temp.am = 'temperature'; 
  
data.Lb = 6.2; units.Lb = 'cm';   label.Lb = 'carapace length at birth';   bibkey.Lb = 'Goet2007';
  comment.Lb = '5.77-6.67 cm';
data.Lp = 8.8; units.Lp = 'cm';   label.Lp = 'carapace length at puberty';   bibkey.Lp = 'Goet2007';
data.Li = 30; units.Li = 'cm';   label.Li = 'ultimate carapace length';   bibkey.Li = 'guess';
data.Lim = 27.5; units.Lim = 'cm';   label.Lim = 'ultimate carapace length for males';   bibkey.Lim = 'Goet2007';

data.Ww0 = 47; units.Ww0 = 'g';   label.Ww0 = 'initial wet weight';   bibkey.Ww0 = 'Goet2007';
  comment.Ww0 = '34.2 - 50.5 g';
data.Wwb = 33; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';   bibkey.Wwb = 'Goet2007';
  comment.Wwb = '31.5 - 36.7 g';
data.Wwim = 2.8e3; units.Wwim = 'g';   label.Wwim = 'ultimate wet weight for males';   bibkey.Wwim = 'Goet2007';

data.Ri  = 2/365; units.Ri  = '#/d'; label.Ri  = 'maximum reprod rate';       bibkey.Ri  = 'Goet2007';   
  temp.Ri = C2K(26);  units.temp.Ri = 'K'; label.temp.Ri = 'temperature';
  comment.Ri = '1-2 eggs per clutch, probably 1 clutches per yr';
  
% uni-variate data

% time-length
data.tWw = [ ... % time  since birth (d), wet weight (g)
17.042	37.571
46.829	59.051
111.922	60.843
135.336	75.369
173.742	78.471
205.706	90.450
232.322	104.970
268.577	111.876
293.062	125.766
331.465	129.502
353.815	143.396
389.068	135.739
419.944	152.152
448.714	162.236
491.373	169.131
539.359	177.916
575.656	175.323
604.455	179.075
631.051	198.028
668.399	199.232
726.857	252.961
762.051	258.601];
units.tWw   = {'d', 'g'};  label.tWw = {'time since birth', 'wet weight'};  
temp.tWw    = C2K(26);  units.temp.tWw = 'K'; label.temp.tWw = 'temperature';
bibkey.tWw = 'Goet2007';

% length-weight
data.LWw_f = [ ... % time  carapace length (cm), weight (g)
     10.2  395
      9.2  325
     18.0 1200
     16.5 1000
     20.1 1430
     18.0 1290
     18.0 1245
     19.5 1500];
units.LWw_f   = {'cm', 'g'};  label.LWw_f = {'carapace length', 'wet weight', 'female'};  
bibkey.LWw_f = 'Goet2007';
comment.LWw_f = 'Data for females';
%
data.LWw_m = [ ... % carapace length (cm), weight (g)
     8.8  430
    19.0 1360
    17.5 1335
    27.5 2850];
units.LWw_m   = {'cm', 'g'};  label.LWw_m = {'carapace length', 'wet weight', 'male'};  
bibkey.LWw_m = 'Goet2007';
comment.LWw_m = 'Data for males';

%% set weights for all real data
weights = setweights(data, []);
weights.tWw = 5 * weights.tWw;
weights.Ri = 5 * weights.Ri;

%% set pseudodata and respective weights
[data, units, label, weights] = addpseudodata(data, units, label, weights);
weights.psd.k_J = 0; weights.psd.k = 3;
data.psd.k = 0.3; units.psd.k  = '-'; label.psd.k  = 'maintenance ratio'; 

%% pack auxData and txtData for output
auxData.temp = temp;
txtData.units = units;
txtData.label = label;
txtData.bibkey = bibkey;
txtData.comment = comment;

%% Group plots
set1 = {'LWw_f','LWw_m'}; subtitle1 = {'Data for females, males'};
metaData.grp.sets = {set1};
metaData.grp.subtitle = {subtitle1};

%% Discussion points
D1 = 'Males are assumed to differ from females by {p_Am} only';   
D2 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1, 'D2', D2);

%% Links
metaData.links.id_CoL = '3KVXC'; % Cat of Life
metaData.links.id_ITIS = '551925'; % ITIS
metaData.links.id_EoL = '456687'; % Ency of Life
metaData.links.id_Wiki = 'Heosemys_spinosa'; % Wikipedia
metaData.links.id_ADW = 'Heosemys_spinosa'; % ADW
metaData.links.id_Taxo = '409437'; % Taxonomicon
metaData.links.id_WoRMS = '1527892'; % WoRMS
metaData.links.id_ReptileDB = 'genus=Heosemys&species=spinosa'; % ReptileDB
metaData.links.id_AnAge = 'Heosemys_spinosa'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Heosemys_spinosa}}';
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
bibkey = 'Goet2007'; type = 'article'; bib = [ ... 
'author = {Matthias Goetz}, ' ... 
'year = {2007}, ' ...
'title = {Husbandry and Breeding of the Spiny Turtle \emph{Heosemys spinosa} ({G}RAY, 1931) at the {D}urrell {W}ildlife {C}onservation {T}rust}, ' ...
'journal = {RADIATA}, ' ...
'volume = {16(2)}, ' ...
'pages = {}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'EoL'; type = 'Misc'; bib = ...
'howpublished = {\url{https://eol.org/pages/456687}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];

