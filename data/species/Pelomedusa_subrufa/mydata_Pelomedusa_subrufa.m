function [data, auxData, metaData, txtData, weights] = mydata_Pelomedusa_subrufa
%% set metaData
metaData.phylum     = 'Chordata'; 
metaData.class      = 'Reptilia'; 
metaData.order      = 'Testudines'; 
metaData.family     = 'Pelomedusidae';
metaData.species    = 'Pelomedusa_subrufa'; 
metaData.species_en = 'African helmeted turtle'; 

metaData.ecoCode.climate = {'Aw', 'BWh', 'BSh', 'Cwa', 'Cwb'};
metaData.ecoCode.ecozone = {'TPa'};
metaData.ecoCode.habitat = {'0bTd', 'biFp', 'biFm'};
metaData.ecoCode.embryo  = {'Tt'};
metaData.ecoCode.migrate = {};
metaData.ecoCode.food    = {'biO'};
metaData.ecoCode.gender  = {'Dtmf'};
metaData.ecoCode.reprod  = {'O'};

metaData.T_typical  = C2K(27); % K, body temp
metaData.data_0     = {'ab'; 'ap'; 'am'; 'Lb'; 'Lp'; 'Li'; 'Wwb'; 'Wwp'; 'Wwi'}; 
metaData.data_1     = {'L-N'}; 

metaData.COMPLETE = 2.5; % using criteria of LikaKear2011

metaData.author   = {'Bas Kooijman'};    
metaData.date_subm = [2017 10 06];              
metaData.email    = {'bas.kooijman@vu.nl'};            
metaData.address  = {'VU University, Amsterdam'}; 

metaData.curator     = {'Starrlight Augustine'};
metaData.email_cur   = {'starrlight@akvaplan.niva.no'}; 
metaData.date_acc    = [2017 10 06];

%% set data
% zero-variate data

data.ab = 55;     units.ab = 'd';    label.ab = 'age at birth';            bibkey.ab = 'pelomedusa';
  temp.ab = C2K(31);  units.temp.ab = 'K'; label.temp.ab = 'temperature';
data.tp = 4*365;     units.tp = 'd';    label.tp = 'time since birth at puberty'; bibkey.tp = 'guess';
  temp.tp = C2K(27);  units.temp.tp = 'K'; label.temp.tp = 'temperature';
  comment.tp = 'guess based on longest period from which [p_M] > 3 J/d.cm^3 at 20 C';
data.am = 20.1*365;     units.am = 'd';    label.am = 'life span';         bibkey.am = 'AnAge';   
  temp.am = C2K(27);  units.temp.am = 'K'; label.temp.am = 'temperature'; 

data.Lb = 3.75; units.Lb = 'cm';   label.Lb = 'carapace length at birth';     bibkey.Lb = 'pelomedusa';
data.Lp = 12; units.Lp = 'cm';   label.Lp = 'carapace length at puberty';  bibkey.Lp = 'pelomedusa';
data.Li = 32.5; units.Li = 'cm';   label.Li = 'ultimate carapace length';  bibkey.Li = 'Wiki';

data.Wwb = 3.84; units.Wwb = 'g';   label.Wwb = 'wet weight at birth';     bibkey.Wwb = {'pelomedusa', 'field_guide'};
  comment.Wwb = 'based on (Lb/Li)^3*Wwi';
data.Wwp = 126; units.Wwp = 'g';   label.Wwp = 'wet weight at puberty';   bibkey.Wwp = {'pelomedusa', 'field_guide'};
  comment.Wwb = 'based on (Lp/Li)^3*Wwi';
data.Wwi = 2500; units.Wwi = 'g';   label.Wwi = 'ultimate wet weight';     bibkey.Wwi = 'field_guide';

% uni-variate data

% length-fecundity
data.LN = [ ... % time since birth (d), wet weight (g)
15.104	10.967
16.113	8.991
16.595	8.993
18.801	11.740
19.009	12.873
19.020	32.967
20.549	15.993
20.801	14.862
21.173	22.977
21.515	18.922
21.867	32.886
23.843	33.839
24.095	33.934
25.636	37.904];
units.LN   = {'cm', '#'};  label.LN = {'carapace length', 'number of eggs'};  
temp.LN    = C2K(27);  units.temp.LN = 'K'; label.temp.LN = 'temperature';
bibkey.LN = 'Stry2001';
comment.LN = 'temp is guessed';

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
D1 = 'In view of low somatic maintenance, pseudodata k_J = 0.002 1/d is replaced by pseudodata k = 0.3';
metaData.discussion = struct('D1', D1);

%% Facts
F1 = 'Males are larger than females'; 
metaData.bibkey.F1 = 'Stry2001';
F2 = 'Does not have a hinged plastron';
metaData.bibkey.F2 = 'Wiki';
F3 = 'Removes ticks and blood-sucking flies from the bodies of warthogs, Cape buffalo and rhinoceroses';
metaData.bibkey.F3 = 'Wiki';
F4 = 'Males and females have two small tentacles (of unknown function) beneath the chin, and musk glands beneath the fourth to eighth marginals'; 
metaData.bibkey.F4 = 'Stry2001';
metaData.facts = struct('F1',F1, 'F2',F2, 'F3',F3, 'F4',F4);

%% Links
metaData.links.id_CoL = '76CSF'; % Cat of Life
metaData.links.id_ITIS = '551817'; % ITIS
metaData.links.id_EoL = '791177'; % Ency of Life
metaData.links.id_Wiki = 'Pelomedusa_subrufa'; % Wikipedia
metaData.links.id_ADW = 'Pelomedusa_subrufa'; % ADW
metaData.links.id_Taxo = '48191'; % Taxonomicon
metaData.links.id_WoRMS = ''; % WoRMS
metaData.links.id_ReptileDB = 'genus=Pelomedusa&species=subrufa'; % ReptileDB
metaData.links.id_AnAge = 'Pelomedusa_subrufa'; % AnAge


%% References
bibkey = 'Wiki'; type = 'Misc'; bib = ...
'howpublished = {\url{http://en.wikipedia.org/wiki/Pelomedusa_subrufa}}';
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
bibkey = 'Stry2001'; type = 'Phdthesis'; bib = [ ... 
'author = {A. V. Strydom}, ' ... 
'year = {2001}, ' ...
'title = {Seasonal reproduction and sexual size dimorphism of the {A}frican Helmeted Turtle, \emph{Pelomedusa subrufa} (Family {P}elomedusidae)}, ' ...
'school = {Univ. of Stellenbosch}'];
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'AnAge'; type = 'Misc'; bib = ...
'howpublished = {\url{http://genomics.senescence.info/species/entry.php?species=Pelomedusa_subrufa}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'pelomedusa'; type = 'Misc'; bib = ...
'howpublished = {\url{http://www.pelomedusa.com/Breeding.html}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];
%
bibkey = 'field_guide'; type = 'Misc'; bib = ...
'howpublished = {\url{http://online-field-guide.com/Pelomedusasubrufa.htm}}';
metaData.biblist.(bibkey) = ['''@', type, '{', bibkey, ', ' bib, '}'';'];


